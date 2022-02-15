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

const emailLabel = document.querySelector('#email-label');
const pwLabel = document.querySelector('#pw-label');

const check = document.querySelectorAll('.l-check');

// --| Create Document
const addDomFail = document.createElement('span');
const addDomSuccess = document.createElement('span');

// --| Table Regular expression
const idRegex = new RegExp(/^[A-Za-z0-9]{4,12}$/);
const pwRegex = new RegExp(/^[A-Za-z0-9]{4,12}$/);
const emailRegex = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
const nameRegex = new RegExp(/^[가-힣]{2,6}$/);
const numRegex = new RegExp(/[^0-9]{1,13}/g);

testInput.addEventListener('keyup', function (e) {

})

for (let i = 0; i < check.length; i++) {
    check[i].onclick = selectChk;
}

// --| CheckBox Limit
function selectChk() {
    let checkedLimit = document.querySelectorAll('.l-check:checked');
    let MAX = 2;

    if (checkedLimit.length > MAX) {
        for (let index = 0; index < check.length; index++) {
            check[index].disabled = true;
        }
        for (let index = 0; index < check.length; index++) {
            checkedLimit[index].disabled = false;
        }
    } else {
        for (let index = 0; index < check.length; index++) {
            check[index].disabled = false;
        }
    }
}

// --| Submit EventLisener
function onSubmit() {
    if (emailRegex.test(email.value) === false) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '이메일 유효성 검사 실패';
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
        addDomFail.textContent = '비밀번호 유효성 검사 실패';
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


}

 // --| 아이디 중복 체크
function idChecking() {
    const xhr = new XMLHttpRequest();
    
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencode');
    xhr.open('POST', '/idcheck', true)
    xhr.send(JSON.stringify(email.value));
    xhr.onload = function () {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200) {
                console.log("Connection!");
                if (xhr.response === "use") {
                    addDomSuccess.remove();
                    addDomFail.classList.add("fail-font");
                    addDomFail.textContent = '아이디가 중복되었습니다.';
                    liEmail.appendChild(addDomFail);
                    email.focus();
                    emailLabel.classList.add("fail-label");
                    email.classList.add("fail-line");
                    return false;
                } else if (xhr.response === "no_use") {
                    addDomFail.remove();
                    emailLabel.classList.remove("fail-label");
                    email.classList.remove("fail-line");
                    addDomSuccess.classList.add('success-font');
                    liEmail.appendChild(addDomSuccess);
                    emailLabel.classList.add("success-label");
                    email.classList.add("success-line");
                }
            } else {
                console.log("Error...");
            }
        } else {
            console.log("Not Found...");
        }
    }
}