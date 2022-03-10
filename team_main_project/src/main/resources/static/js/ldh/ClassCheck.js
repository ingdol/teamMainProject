/**
 * 
 */
function validate2(){
	var classArea1 = ClassCreateForm.classArea1.value;
	var classArea2 =  ClassCreateForm.state.value;
	var classTitle = ClassCreateForm.classTitle.value;
	var classInfo =  ClassCreateForm.classInfo.value;
	var hobbyNo =  ClassCreateForm.hobbyNo.value;
	var memNick =  ClassCreateForm.memNick.value;
	
	
	if(!check2(classArea1, "주소를")){
		return false;
		}
	else if(!Areacheck2(classArea2, "군/구를")){
		return false;}
		else if(!check2(hobbyNo, "카테고리를")){
		return false;}
	else if(!check2(classTitle, "클래스 이름을")){
		return false;}
		else if(!check2(classInfo, "클래스 정보를")){
		return false;}
		else if(!check2(memNick, "로그인 후에")){
		return false;}
		else{
			return true;
		}
	
}

function check2(value, dataName) {
        if (value == null || value=="") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        else{
        return true;
        
        }
    }
function Areacheck2(value, dataName) {
        if (value=="군/구 선택" || value=="") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        else{
        return true;
        
        }
    }