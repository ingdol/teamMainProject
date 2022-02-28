/**
 * 
 */
 

$('#CommentForm1').on('submit', function() {

	document.getElementById('gatDetComInfo').onsubmit = function() {
		

		var gatDetComInfo = document.getElementById('gatDetComInfo');
		

		if(gatDetComInfo.value == ""){
			alert("댓글을 입력하세요.");
			gatDetComInfo.focus();
			return false;
		}
		
		}
		})
function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }