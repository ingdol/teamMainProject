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

function signinData() {

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









    const xhr = new XMLHttpRequest;
    const data = {
        id: email.value,
        pw: pw.value,
        // --| Immediately invoked function expression(IIFE)
        test: (function () {

            return 'test';
        }())
    }

    xhr.open('POST', 'signin', false);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(data));
    xhr.onload = function () {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200) {
                console.log("Connection!")
            } else {
                console("Error...")
            }
        } else {
            console("Not Found...")
        }
    }
}