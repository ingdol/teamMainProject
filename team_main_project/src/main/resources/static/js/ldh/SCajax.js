/**
 * 
 */
function validate(){
	var gatArea1 = SCreateForm.gatArea1.value;
	var gatArea2 =  SCreateForm.state.value;
	var gatName = SCreateForm.gatName.value;
	var gatInfo =  SCreateForm.gatInfo.value;
	var hobbyNo =  SCreateForm.hobbyNo.value;
	var memNick =  SCreateForm.memNick.value;
	
	
	if(!check(gatArea1, "주소1을")){
		return false;
		}
	else if(!Areacheck(gatArea2, "주소2를")){
		return false;}
		else if(!check(hobbyNo, "카테고리를")){
		return false;}
	else if(!check(gatName, "소모임 이름을")){
		return false;}
		else if(!check(memNick, "로그인 후에")){
		return false;}
		else{
			return true;
		}
	
}

function check(value, dataName) {
        if (value == null || value=="" ) {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        else{
        return true;
        
        }
    }

    
function Areacheck(value, dataName) {
        if (value=="군/구 선택" || value=="") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        else{
        return true;
        
        }
    }