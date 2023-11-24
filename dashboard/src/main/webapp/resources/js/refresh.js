/* 정각이 되면 페이지 리프레쉬 시작 */
/* 매 시간 정각마다 페이지 리프레쉬 시작 */
function refreshAtTopOfHour() {
    // 현재 시간 정보 가져오기
    var now = new Date();
    
    // 다음 정각 시간 설정
    var nextHour = new Date(now);
    nextHour.setHours(now.getHours() + 1);
    nextHour.setMinutes(0);
    nextHour.setSeconds(0);
    nextHour.setMilliseconds(0);
    
    // 다음 정각까지의 시간 계산
    var millisTillNextHour = nextHour - now;
    
    // 정각이 이미 지났으면 다음 시간으로 설정
    if (millisTillNextHour < 0) {
        millisTillNextHour += 3600000; // 1시간 = 3600000 밀리초
    }
    
    // 타이머 설정하여 매 정각마다 새로 고침
    setInterval(function () {
        location.reload(true); // true 파라미터는 캐시를 무시하고 새로고침
    }, millisTillNextHour);
}
