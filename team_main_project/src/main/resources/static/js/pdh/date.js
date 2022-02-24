// --| 로그인 시각
const clock = () => {
    const time = new Date();
    const hours = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds();

    const year = time.getFullYear();
    const month = time.getMonth() + 1;
    const date = time.getDate();

    let loginTime = `L ${year}/${month}/${date} - ${hours < 10 ? 0 + hours : hours}:${minutes < 10 ? '0' + minutes : minutes}:${seconds < 10 ? '0' + seconds : seconds} `
    
    return loginTime;
};

// --| 년도
const year = () => {
    const time = new Date();
    const year = time.getFullYear();
    
    return year;
};

export { clock, year };