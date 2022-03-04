const nodemailer = require('nodemailer');

module.exports.toEmail = function test(toEmail) {
    let authNums = module.exports.authNums = Math.random().toString().substring(2,6);

    var transporter = nodemailer.createTransport({  // transporter 에서 보낼 메일아이디와 비번 설정
        service: 'gmail', // 이메일 보내는 서비스 주소
        auth: {
            user:'bee6438379@gmail.com',
            pass:'pjckqlqdnmlzgmvm'
        }, 
        tls: {
            rejectUnauthorized: false, 
        }
    })

    var mailOption = { // 메일 옵션  설정
        from: 'bee6438379@gmail.com',  // sender address
        // to: "bee6438379@gmail.com",
        to: toEmail,
        subject: '이메일 인증 subject',
        text: "Hello world...",
        html: `<p>Hello world</p> ${authNums}` // html body
    };
            
    transporter.sendMail(mailOption, function(err, res){ // 메일 발송

        if (err) {

            console.log(err);

        } else {
            console.log('이메일발송성공');

        }

        transporter.close();
    });
}