// --| SignIn JavaScript
// --| ECMAScript 6
// --| Document Object Model
// --| Author: ParkDoHun
import { execDaumPostcode, postcode, detailAddress, address } from "./execDaumPostcode.js";
import { clock, year } from "./date.js";

// --| input Tag
const name = document.querySelector('#name');
const email = document.querySelector('#email');
const pw = document.querySelector('#pw');
const nick = document.querySelector('#nick');
const number = document.querySelector('#number');
const yearBirth = document.querySelector('#year');
const dayBirth = document.querySelector('#day');
const auth = document.querySelector('#auth');
const monthBirth = document.querySelector('.textBox');

// --| li Tag
const liName = document.querySelector('#l-name');
const liEmail = document.querySelector('#l-email');
const liPw = document.querySelector('#l-pw');
const liNick = document.querySelector('#l-nick');
const liNumber = document.querySelector('#l-number');
const liBirth = document.querySelector('#l-birth');
const liAddress = document.querySelector('#l-address');
const liDetailAddress = document.querySelector('#l-detail-address');
const liAuth = document.querySelector('#l-auth');


// --| label Tag
const nameLabel = document.querySelector('#name-label');
const emailLabel = document.querySelector('#email-label');
const pwLabel = document.querySelector('#pw-label');
const nickLabel = document.querySelector('#nick-label');
const numberLabel = document.querySelector('#number-label');
const postcodeLabel = document.querySelector('#postcode-label');
const addressLabel = document.querySelector('#address-label');
const detailAddressLabel = document.querySelector('#detailAddress-label');
const yearLabel = document.querySelector('#year-label');
const dayLabel = document.querySelector('#day-label');
const authLabel = document.querySelector('#auth-label');

// --| Button Tag
const addressBtn = document.querySelector('#address-btn');
const authBtn = document.querySelector('#auth-btn');
const authCheckBtn = document.querySelector('#auth-check-btn');

// --| Title Tag
const titleHobby = document.querySelector('#title-hobby');
const titleBirth = document.querySelector('#title-birth');

// --| Calendar div Tag
const month1 = document.querySelector('#month-1');
const month2 = document.querySelector('#month-2');
const month3 = document.querySelector('#month-3');
const month4 = document.querySelector('#month-4');
const month5 = document.querySelector('#month-5');
const month6 = document.querySelector('#month-6');
const month7 = document.querySelector('#month-7');
const month8 = document.querySelector('#month-8');
const month9 = document.querySelector('#month-9');
const month10 = document.querySelector('#month-10');
const month11 = document.querySelector('#month-11');
const month12 = document.querySelector('#month-12');

// --| Create Document
const addDomFail = document.createElement('span');
const addDomSuccess = document.createElement('span');

// --| Table Regular expression
const nickRegex = new RegExp(/^[A-Za-z0-9-???-???]{2,12}$/);
const pwRegex = new RegExp(/^[A-Za-z0-9]{6,18}$/);
const nameRegex = new RegExp(/^[???-???]{2,6}$/);
const numRegex = new RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);
const emailRegex = new RegExp(
	/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
);

// --| CheckBox
const check = document.querySelectorAll('.l-check');

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
        for (let index = 0; index < checkedLimit.length; index++) {
            checkedLimit[index].disabled = false;
        }
    } else {
        for (let index = 0; index < check.length; index++) {
            check[index].disabled = false;
        }
    }
}

authBtn.onclick = async function(event) {
	event.preventDefault();
    // --| Email Duplicated
    if(await emailChecking() === true) {
		auth.focus();
	} else{
		email.focus();
		return false;
	}
	
    if (emailRegex.test(email.value) === false) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '???????????? ????????? ?????????.';
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
        // addDomSuccess.textContent = '??? ?????? ????????? ?????? ??????';
        liEmail.appendChild(addDomSuccess);
        emailLabel.classList.add("success-label");
        email.classList.add("success-line");
        authBtn.textContent = '?????????';
        await emailAuth();
        auth.focus();
        
        return false;
    }
}

let numTemp = NaN; // ??????????????? ??????????????? ??????
authCheckBtn.onclick = (event) => {
	event.preventDefault();
	if (numTemp !== auth.value) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '??????????????? ?????? ??????????????????.';
        liAuth.appendChild(addDomFail);
        auth.focus();
        authLabel.classList.add("fail-label");
        auth.classList.add("fail-line");
        return false;
	} else {
        addDomFail.remove();
        authLabel.classList.remove("fail-label");
        auth.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '??? ?????? ????????? ?????? ??????';
        liAuth.appendChild(addDomSuccess);
        authLabel.classList.add("success-label");
        auth.classList.add("success-line");
	}
}

addressBtn.addEventListener('click', function(event){
    event.preventDefault();
    execDaumPostcode();
});

email.addEventListener('change', function(event){
    event.preventDefault();
    emailChecking();
});

nick.addEventListener('change', function(event){
    event.preventDefault();
    nickChecking();
});

// --| Submit
document.querySelector('form').addEventListener('submit', function(event){
    event.preventDefault();
    onSubmit();
});

let birthLevel = true;
let hobbyLevel = true;

async function onSubmit() {
    // --| Email Duplicated
    if(await emailChecking() === true) {

	} else{
		email.focus();
		return false;
	}
	
	// --| Email
    if (emailRegex.test(email.value) === false) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '???????????? ????????? ?????????.';
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
        // addDomSuccess.textContent = '??? ?????? ????????? ?????? ??????';
        liEmail.appendChild(addDomSuccess);
        emailLabel.classList.add("success-label");
        email.classList.add("success-line");
    }
    
    // --| Auth
	if (numTemp !== auth.value) {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '??????????????? ?????? ??????????????????.';
        liAuth.appendChild(addDomFail);
        auth.focus();
        authLabel.classList.add("fail-label");
        auth.classList.add("fail-line");
        return false;
	} else {
        addDomFail.remove();
        authLabel.classList.remove("fail-label");
        auth.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '??? ?????? ????????? ?????? ??????';
        liAuth.appendChild(addDomSuccess);
        authLabel.classList.add("success-label");
        auth.classList.add("success-line");
	}
    
    // --| Password
    if (pwRegex.test(pw.value) === false) {
        // addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '???????????? 6~18??????';
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
        // addDomSuccess.textContent = '??? ???????????? ????????? ?????? ??????';
        liPw.appendChild(addDomSuccess);
        pwLabel.classList.add("success-label");
        pw.classList.add("success-line");
    }
    
    // --| Name
	if (nameRegex.test(name.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '????????? ???????????????.';
	    liName.appendChild(addDomFail);
	    name.focus();
	    nameLabel.classList.add("fail-label");
	    name.classList.add("fail-line");
	    return false;
	} else {
        addDomFail.remove();
        nameLabel.classList.remove("fail-label");
        name.classList.remove("fail-line");
        addDomSuccess.classList.add('success-font');
        // addDomSuccess.textContent = '??? ???????????? ????????? ?????? ??????';
        liName.appendChild(addDomSuccess);
        nameLabel.classList.add("success-label");
        name.classList.add("success-line");
    }
    
	// --| 'Year' Birthday
	if(yearBirth.value === '') {
		titleBirth.classList.add("fail-label");
        yearLabel.classList.add("fail-label");
        yearBirth.classList.add("fail-line");
        yearBirth.focus();
        return false;
	} else {
		titleBirth.classList.remove("fail-label");
		yearLabel.classList.remove("fail-label");
		yearBirth.classList.remove("fail-line");
		titleBirth.classList.add("success-label");
        yearLabel.classList.add("success-label");
        yearBirth.classList.add("success-line");
	}
	
    // --| 'Month' Birthday
    if(monthBirth.value === '') {
		titleBirth.classList.add("fail-label");
		monthBirth.focus();
		if(birthLevel === true) {
			birthLevel = false;
			monthBirth.classList.add("fail-bg");
			// monthBirth.focus();
			setTimeout(function() {
				monthBirth.classList.remove("fail-bg");
				birthLevel = true;
			}, 1000)
		}
		return false;
	} else {
		titleBirth.classList.remove("fail-label");
		liBirth.classList.remove("fail-line");
		titleBirth.classList.add("success-label");
	}
	
	// --| 'Day' Birthday
	if(dayBirth.value === '') {
		titleBirth.classList.add("fail-label");
        dayLabel.classList.add("fail-label");
        dayBirth.classList.add("fail-line");
        dayBirth.focus();
        return false;
	} else {
		titleBirth.classList.remove("fail-label");
		dayLabel.classList.remove("fail-label");
		dayBirth.classList.remove("fail-line");
		titleBirth.classList.add("success-label");
		dayLabel.classList.add("success-label");
        dayBirth.classList.add("success-line");
	}
	
    // --| NickName Duplicated
    if(await nickChecking() === true) {

	} else{
		return false;
	}
    
    // --| NickName
    if (nickRegex.test(nick.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '????????? 2~12??????';
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
        // addDomSuccess.textContent = '??? ???????????? ????????? ?????? ??????';
        liNick.appendChild(addDomSuccess);
        nickLabel.classList.add("success-label");
        nick.classList.add("success-line");
    }
    
    // --| Phone Number
    if (numRegex.test(number.value) === false) {
	    // addDomSuccess.remove();
	    addDomFail.classList.add("fail-font");
	    addDomFail.textContent = '??????????????? ???????????????.';
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
        // addDomSuccess.textContent = '??? ???????????? ????????? ?????? ??????';
        liNumber.appendChild(addDomSuccess);
        numberLabel.classList.add("success-label");
        number.classList.add("success-line");
    }
    
    // --| Hobby Check Box
    let checkedLimit = document.querySelectorAll('.l-check:checked');
    if(checkedLimit.length <= 2) {
		titleHobby.classList.add("fail-label");
		if(hobbyLevel === true) {
				hobbyLevel = false;
				titleHobby.classList.add("fail-hobby-label");
				setTimeout(function() {
					titleHobby.classList.remove("fail-hobby-label");
					hobbyLevel = true;
				}, 1000)
		}
		return false;
	} else {
		titleHobby.classList.remove("fail-label");
		titleHobby.classList.add("success-label");
	}
	
	// --| Post Address
	if(postcode.value === '') {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '???????????? ????????? ?????????.';
        liAddress.appendChild(addDomFail);
        postcodeLabel.classList.add("fail-label");
        postcode.classList.add("fail-line");
		return false;
	} else {
        addDomFail.remove();
        postcodeLabel.classList.remove("fail-label");
        postcode.classList.remove("fail-line");
        postcodeLabel.classList.add("success-label");
        postcode.classList.add("success-line");
        addressLabel.classList.add("success-label");
        address.classList.add("success-line");
	}
	
	// --| Detail Address
	if(detailAddress.value === '') {
        addDomSuccess.remove();
        addDomFail.classList.add("fail-font");
        addDomFail.textContent = '??????????????? ????????? ?????????.';
        liDetailAddress.appendChild(addDomFail);
		detailAddress.focus();
        detailAddressLabel.classList.add("fail-label");
        detailAddress.classList.add("fail-line");
		return false;
	} else {
		addDomFail.remove();
        detailAddressLabel.classList.remove("fail-label");
        detailAddress.classList.remove("fail-line");
        detailAddressLabel.classList.add("success-label");
        detailAddress.classList.add("success-line");
	}
    
    await userSignup();
    
    location.href = '/';
}

// --| Submit ????????? ??????
async function userSignup() {
	let monthTmp = monthBirth.value.replace('???', '');
	
	// ?????? 1~9??? ?????? ???????????? 0 ??????
	if(monthTmp < 10) {
		monthTmp = `0${monthTmp}`;
	}
	
    await fetch('/user-signup', {
	method: 'POST', 
	headers: { 'Content-Type': 'application/json' },
	body: JSON.stringify({
		name: name.value, 
		email: email.value,
		pw: pw.value, 
		nick: nick.value, 
		phone: number.value, 
		birth: `${yearBirth.value}-${monthTmp}-${dayBirth.value}`,
		point: '0',
		hobby: (function() { // ??????????????? ????????? ???
					let checkedLimit = document.querySelectorAll('.l-check:checked');
					let Arr = new Array();
		    		for(let i = 0; i < checkedLimit.length; i++) {
						if(checkedLimit[i]) {
							Arr.push(checkedLimit[i].value);
						}
					}
					return Arr.toString();
		}()),
		address: address.value,
	}), 
	})
	.then(res => {
		if(res.status === 200) {
			console.log('???????????? ?????? ??????(res.status === 200)');
		} else {
			console.log('fail.. ?????? ??????');
		}
		return res.json();
	})
	.catch(err => {
		console.log(err);
	})
}

// --| Email Duplicated (onload)
async function emailChecking() {
	let checkEmail = true;

    await fetch('/idcheck', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: email.value,
    })
    .then((res) => {
        if(res.status === 200) {
            console.log("connection");
            console.log(clock());
        }
        return res.json();
    })
    .then((data) => {
        if (data.id === "use") {
            addDomSuccess.remove();
            addDomFail.classList.add("fail-font");
            addDomFail.textContent = '?????? ???????????? ????????? ?????????.';
            liEmail.appendChild(addDomFail);
            // email.focus();
            emailLabel.classList.add("fail-label");
            email.classList.add("fail-line");
            checkEmail = false;
        } else if(data.id === "no_use"){
			addDomFail.remove();
			addDomFail.textContent = '';
			checkEmail = true;
		}
    })
    .catch((err) => console.log(err))

    return checkEmail;
}

// --| NickName Duplicated (onload)
async function nickChecking() {
	let checkNick = true;

    await fetch('/nickcheck', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: nick.value,
    })
    .then((res) => {
        if(res.status === 200) {
            console.log("connection");
            console.log(clock());
        }
        return res.json();
    })
    .then((data) => {
        if (data.nick === "use") {
            addDomSuccess.remove();
            addDomFail.classList.add("fail-font");
            addDomFail.textContent = '?????? ???????????? ????????? ?????????.';
            liNick.appendChild(addDomFail);
            nick.focus();
            nickLabel.classList.add("fail-label");
            nick.classList.add("fail-line");
            checkNick = false;
        } else if(data.nick === "no_use"){
			addDomFail.remove();
			addDomFail.textContent = '';
			checkNick = true;
		}
    })
    .catch((err) => console.log(err))

    return checkNick;
}

// --| Email Auth Send
async function emailAuth() {
	let authNum = '';

    await fetch('/auth-send', {
        method: 'POST', 
        headers: { 'Content-Type': 'application/json' }, 
        body: email.value,
    })
    .then((res) => {
        if(res.status === 200) {
            console.log("connection");
            console.log(clock());
        }
        return res.json();
    })
    .then((data) => {
		console.log("dataNum : ", data.num);
		authNum = data.num;
		numTemp = data.num;
    })
    .catch((err) => console.log(err))

    return authNum;
}

function showCalendar(month) {
	monthBirth.value = month;
}

month1.onclick = function() {
	showCalendar('1???');
}

month2.onclick = function() {
	showCalendar('2???');
}

month3.onclick = function() {
	showCalendar('3???');
}

month4.onclick = function() {
	showCalendar('4???');
}

month5.onclick = function() {
	showCalendar('5???');
}

month6.onclick = function() {
	showCalendar('6???');
}

month7.onclick = function() {
	showCalendar('7???');
}

month8.onclick = function() {
	showCalendar('8???');
}

month9.onclick = function() {
	showCalendar('9???');
}

month10.onclick = function() {
	showCalendar('10???');
}

month11.onclick = function() {
	showCalendar('11???');
}

month12.onclick = function() {
	showCalendar('12???');
}

// --| DropDown ?????? ?????????
const dropdown = document.querySelector('.dropdown');
dropdown.onclick = function() {
	this.classList.toggle('active');
	monthBirth.classList.toggle('togglefocus');
}

dayBirth.addEventListener('change', function() {
	let num = parseInt(this.value);
	if (num < 1) {
		this.value = 1;
	}
	
	if (num > 31) {
		this.value = 31;
	}
})

yearBirth.addEventListener('change', function() {
	let num = parseInt(this.value);
	if (num < year() - 120) {
		this.value = year() - 120;
	}
	
	if (num > year()) {
		this.value = year();
	}
})

// --| '????????????' ????????? ??????
auth.addEventListener('keydown',function(e){
	if(!((e.keyCode > 47 && e.keyCode < 58) || 
	e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
		e.preventDefault();
	}
});

// --| '??????' ????????? ??????
yearBirth.addEventListener('keydown',function(e){
	if(!((e.keyCode > 47 && e.keyCode < 58) || 
	e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
		e.preventDefault();
	}
});

// --| '???' ????????? ??????
dayBirth.addEventListener('keydown',function(e){
	if(!((e.keyCode > 47 && e.keyCode < 58) || 
	e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
		e.preventDefault();
	}
});

// --| ????????? required ????????? ??????
document.addEventListener('invalid', (function () {
    return function (e) {
      	e.preventDefault();
      	document.getElementById("email").focus();
    };
})(), true)

// --| ENTER KEY ??????
document.body.addEventListener('keydown', function(e) {
    if(e.key === 'Enter') {
        e.preventDefault();
    };
})
