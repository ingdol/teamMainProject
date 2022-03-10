/**
 * 
 */
function validate3(){
	var spaceArea = SpaceCreateForm.spaceArea.value;
	var spaceTitle =  SpaceCreateForm.spaceTitle.value;
	let spacePrice1 = SpaceCreateForm.spacePrice1.value;
	let spacePrice2 =  SpaceCreateForm.spacePrice2.value;
	let spaceInfo =  SpaceCreateForm.spaceInfo.value;
	let spacePerNum =  SpaceCreateForm.spacePerNum.value;
	let spacePerMax =  SpaceCreateForm.spacePerMax.value;
	var memNick =  SpaceCreateForm.memNick.value;
	
	if(!check3(spaceArea, "주소를")){
		return false;
		}
		else if(!check3(spaceTitle, "공간 소개글의 제목을")){
		return false;}
		else if(!check3(spaceInfo, "공간 소개글을")){
		return false;}
	else if(!check3(spacePrice1, "최소 가격을")){
		return false;}
		else if(!check3(spacePrice2, "최대 가격을")){
		return false;}
		else if(!check3(spacePerNum, "최소 수용인원을 입력해주세요.")){
		return false;}
		else if(!check3(spacePerMax, "최대 수용인원을 입력해주세요.")){
		return false;}
		else if(!check3(memNick, "로그인 후에")){
		return false;}
		else{
			return true;
		}
	
}

function check3(value, dataName) {
        if (value == null || value=="") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        else{
        return true;
        
        }
    }
