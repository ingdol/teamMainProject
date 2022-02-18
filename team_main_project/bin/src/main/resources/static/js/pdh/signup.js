// --| SignIn JavaScript
// --| ECMAScript 6
// --| Document Model Object
// --| Author: ParkDoHun

"use strict"
// --| input Tag
const submitBtn = document.querySelector('#l-submit');	// Submit Button
const userName = document.querySelector('#name');
const email = document.querySelector('#email');
const pw = document.querySelector('#pw');
const nick = document.querySelector('#nick');
const number = document.querySelector('#number');

// --| li Tag
const liName = document.querySelector('#l-name');
const liEmail = document.querySelector('#l-email');
const liPw = document.querySelector('#l-pw');
const liNick = document.querySelector('#l-nick');
const liNumber = document.querySelector('#l-number');

// --| label Tag
const nameLabel = document.querySelector('#name-label');
const emailLabel = document.querySelector('#email-label');
const pwLabel = document.querySelector('#pw-label');
const nickLabel = document.querySelector('#nick-label');
const numberLabel = document.querySelector('#number-label');

const check = document.querySelectorAll('.l-check');

// --| Create Document
const addDomFail = document.createElement('span');
const addDomSuccess = document.createElement('span');

// --| Table Regular expression
const nickRegex = new RegExp(/^[A-Za-z0-9]{2,12}$/);
const pwRegex = new RegExp(/^[A-Za-z0-9]{4,12}$/);
const emailRegex = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
const nameRegex = new RegExp(/^[가-힣]{2,6}$/);
const numRegex = new RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);

// --| CheckBox Limit
for (let i = 0; i < check.length; i++) {
    check[i].onclick = selectChk;
}

// --| CheckBox Limit Function
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

// --| Submit
async function onSubmit() {	
    if (nameRegex.test(userName.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '이름을 입력하세요.';
	    liName.appendChild(addDomFail);
	    userName.focus();
	    nameLabel.classList.add("fail-label");
	    userName.classList.add("fail-line");
	    return false;
    } else {
        addDomFail.remove();
        nameLabel.classList.remove("fail-label");
        userName.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '✔ 비밀번호 유효성 검사 성공';
        liName.appendChild(addDomSuccess);
        nameLabel.classList.add("success-label");
        userName.classList.add("success-line");
    }
    
    // --| Email Duplicated
    if(await idChecking() === true) {

	} else if (await idChecking() === false) {
		return await idChecking();
	}

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
        // addDomSuccess.textContent = '✔ 메일 유효성 검사 성공';
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
        // addDomSuccess.textContent = '✔ 비밀번호 유효성 검사 성공';
        liPw.appendChild(addDomSuccess);
        pwLabel.classList.add("success-label");
        pw.classList.add("success-line");
    }
    
    if (nickRegex.test(nick.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '비밀번호 6자리 이상';
	    liNick.appendChild(addDomFail);
	    nick.focus();
	    nickLabel.classList.add("fail-label");
	    nick.classList.add("fail-line");
	    return false;
    } else {
        addDomFail.remove();
        nickLabel.classList.remove("fail-label");
        nick.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '✔ 비밀번호 유효성 검사 성공';
        liNick.appendChild(addDomSuccess);
        nickLabel.classList.add("success-label");
        nick.classList.add("success-line");
    }
    
    if (numRegex.test(number.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '비밀번호 6자리 이상';
	    liNumber.appendChild(addDomFail);
	    number.focus();
	    numberLabel.classList.add("fail-label");
	    number.classList.add("fail-line");
	    return false;
    } else {
        addDomFail.remove();
        numberLabel.classList.remove("fail-label");
        number.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '✔ 비밀번호 유효성 검사 성공';
        liNumber.appendChild(addDomSuccess);
        numberLabel.classList.add("success-label");
        number.classList.add("success-line");
    }
}

// --| Email Duplicated (onload)
async function idChecking() {
	
	let checkId = true;
	
    await fetch('/idcheck', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: email.value,
    })
    .then(res => {
        if(res.status === 200) {
            console.log("connection");
        }
        return res.json();
    })
    .then((data) => {
        if (data.id === "use") {
            addDomSuccess.remove();
            addDomFail.classList.add("fail-font");
            addDomFail.textContent = '이미 존재하는 이메일 입니다.';
            liEmail.appendChild(addDomFail);
            email.focus();
            emailLabel.classList.add("fail-label");
            email.classList.add("fail-line");
            checkId = false;
        } else if(data.id === "no_use"){
			checkId = true;
		}
    })
    .catch((err) => console.log(err))
    
    return checkId;
}