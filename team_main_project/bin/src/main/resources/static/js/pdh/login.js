// --| SignIn JavaScript
// --| ECMAScript 6
// --| Document Model Object
// --| Author: ParkDoHun
"use strict"
const testInput = document.querySelector('.l-input');
const submitBtn = document.querySelector('#l-submit');
const email = document.querySelector('#email');
const pw = document.querySelector('#pw');
const liEmail = document.querySelector('#l-email');
const liPw = document.querySelector('#l-pw');
const chkSaveId = document.querySelector('#id-save');

const emailLabel = document.querySelector('#email-label');
const pwLabel = document.querySelector('#pw-label');

// --| Create Document
const addDomFail = document.createElement('span');
const addDomSuccess = document.createElement('span');

// --| Table Regular Expression
const pwRegex = new RegExp(/^[A-Za-z0-9]{6,12}$/);
const emailRegex = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);


testInput.addEventListener('keyup', function (e) {

})

function signinData() {

}

// --| Submit EventLisener
function onSubmit() {
    if (emailRegex.test(email.value) === false) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '이메일을 입력해 주세요.';
        liEmail.appendChild(addDomFail);
        email.focus();
        emailLabel.classList.add("fail-label");
        email.classList.add("fail-line");
        return false;
    } else {
        addDomFail.remove();
        emailLabel.classList.remove("fail-label");
        email.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '이메일 유효성 검사 성공';
        liEmail.appendChild(addDomSuccess);
        emailLabel.classList.add("success-label");
        email.classList.add("success-line");

    }

    if (pwRegex.test(pw.value) === false) {
        // addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '비밀번호 6자리 이상';
        liPw.appendChild(addDomFail);
        pw.focus();
        pwLabel.classList.add("fail-label");
        pw.classList.add("fail-line");
        return false;
    } else {
        addDomFail.remove();
        pwLabel.classList.remove("fail-label");
        pw.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '비밀번호 유효성 검사 성공';
        liPw.appendChild(addDomSuccess);
        pwLabel.classList.add("success-label");
        pw.classList.add("success-line");
    }

    // --| ID Save
    if(chkSaveId.checked == true) {
        setCookie("saveid", email.value, 7); // Expires / Max-Age 7Day
    } else {
        setCookie("saveid", email.value, 0); // Expires / Max-Age 0Day (Delete Cookie)
    }

    fetch('/signin', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: JSON.stringify({
            id: email.value, 
            pw: pw.value, 
        }), 
    })
    .then(res => {
    	if(res.status === 200) {
            console.log("Connection!");
        }
        
        return res.text();
    })
    .then((data) => {
	console.log(data);
		if(data === "fail") {
            alert("fail");
            return false;
        } else if(data === "success") {
            alert("success");
        }
	})
    .catch((err) => console.log(err))
    
}

// --| 페이지 로드 후 쿠키 정보 확인
window.onload = function() {
    if (getCookie("saveid")) {
        email.value = getCookie("saveid");
        chkSaveId.checked = true;
    }
}

/**
 * 쿠키 정보를 불러온다.
 * 
 * @param {string} name : Cookie Key
 */
function getCookie(name) {
    var search = name + "=";
    if(document.cookie.length > 0) {
        let offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            let end = document.cookie.indexOf(";", offset);
            if (end == -1) {
                end = document.cookie.length;
                return decodeURIComponent(document.cookie.substring(offset, end));
            }    
        }
    }
}

/**
 * 쿠키 정보를 저장한다.
 *
 * @param {string} nameKey : Cookie Key
 * @param {string} value : Email Value
 * @param {string} expires : 현재 시간
 * @Date : 2022. 02. 14.
*/
function setCookie(nameKey, value, expires) {
    var expdate = new Date();
    expdate.setDate(expdate.getDate() + expires);
    let strCookie = "";

    strCookie = `${nameKey}=${encodeURIComponent(value)}; path=/; expires=${expdate.toUTCString()}`;
    document.cookie = strCookie;

}