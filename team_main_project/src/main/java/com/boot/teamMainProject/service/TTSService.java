package com.boot.teamMainProject.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service 
public class TTSService {
	
	// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환
	public String chatbotTextToSpeech(String message) {
		String clientId = "fy8qjrpksr";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "IuCETI5cUcQa2h7NDbdiNpgER2DapAYpkDd0l68g";//애플리케이션 클라이언트 시크릿값";
       
        String voiceFileName = "";
        
        try {        	
        	
            String text = URLEncoder.encode(message, "UTF-8"); // 
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            String postParams = "speaker=nara&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로 mp3 파일 생성
                String tempname = Long.valueOf(new Date().getTime()).toString();
                //File f = new File(tempname + ".mp3");
                
                voiceFileName = "tts_" + tempname + ".mp3";    
				/* File f = new File("C:/upload/" + voiceFileName); */
                File f = new File("/voice/"  +  voiceFileName);                  
                f.createNewFile();
                
                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return voiceFileName;  // 저장된 음성 파일명 반환
	}
	
	// 파일 경로를 전달받아서 파일 내 텍스트 추출해서 반환 함수
	public String fileRead(String filePathName) {
		String result = "";
		
		try {
			File file = new File(filePathName);
			FileReader fr = new FileReader(file);
			
			BufferedReader br = new BufferedReader(fr);
			String line = "";
			while((line = br.readLine()) != null){
				result += line;
			}
			br.close();			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(result); // 출력해서 확인
		return result;
	}
}