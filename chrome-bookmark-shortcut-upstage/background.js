if (window == top) {
    window.addEventListener('keyup', doKeyPress, false);
}

var bookmarks = {}, url;

bookmarks['A'] = 'https://aqicn.org/city/korea/gyeonggi/suwon-si/uman-dong';
bookmarks['B'] = 'https://github.com/uber-go/guide/blob/master/style.md';
bookmarks['C'] = 'https://calendar.google.com/calendar';
bookmarks['D'] = 'https://drive.google.com/drive/folders/0AMOEfcF1r0giUk9PVA';
// bookmarks['E'] = 'https://emart.ssg.com/';
bookmarks['F'] = 'https://flex.team';
bookmarks['G'] = 'https://mail.google.com/mail';
// bookmarks['G'] = 'https://go.dev/talks/2013/bestpractices.slide#1'
bookmarks['H'] = 'https://chat.openai.com/';
bookmarks['I'] = 'https://chat.instage.ai/ko';
bookmarks['J'] = 'https://agi4work.atlassian.net/jira/software/projects/AIDO/boards/59';
bookmarks['K'] = 'https://map.kakao.com/';
bookmarks['L'] = 'https://leetcode.com/problemset/all/';
bookmarks['M'] = 'https://map.naver.com/';
bookmarks['N'] = 'https://www.naver.com/';
// bookmarks['O'] = 'https://';
bookmarks['P'] = 'https://www.perplexity.ai';
// bookmarks['Q'] = 'https://';
// bookmarks['R'] = 'https://';
// bookmarks['S'] = 'https://';
bookmarks['T'] = 'https://www.notion.so';
bookmarks['U'] = 'https://music.youtube.com';
// bookmarks['V'] = 'https://';
bookmarks['W'] = 'https://weather.naver.com/';
// bookmarks['X'] = 'chrome://extensions';
bookmarks['Y'] = 'https://www.youtube.com/';
// bookmarks['Z'] = 'https://';
// bookmarks['1'] = 'https://www.11st.co.kr/';
// bookmarks['2'] = 'https://';
// bookmarks['3'] = 'https://';
// bookmarks['4'] = 'https://';
// bookmarks['5'] = 'https://';
// bookmarks['6'] = 'https://';
// bookmarks['7'] = 'https://';
// bookmarks['8'] = 'https://';
// bookmarks['9'] = 'https://';
// bookmarks['0'] = 'https://';

function doKeyPress(event){
    if(event.ctrlKey && event.altKey && !event.shiftKey) {
        if(url = bookmarks[String.fromCharCode(event.keyCode)]) {
            window.open(url);
        }   
    }
}
