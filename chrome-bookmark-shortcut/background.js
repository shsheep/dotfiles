if (window == top) {
    window.addEventListener('keyup', doKeyPress, false);
}

var bookmarks = {}, url;

bookmarks['A'] = 'https://aqicn.org/city/korea/gyeonggi/suwon-si/uman-dong';
// bookmarks['B'] = 'https://';
bookmarks['C'] = 'https://www.coupang.com/';
bookmarks['D'] = 'https://www.deepl.com/ko/translator';
bookmarks['E'] = 'https://emart.ssg.com/';
// bookmarks['F'] = 'https://www.codeforces.com/';
bookmarks['G'] = 'https://www.github.com';
// bookmarks['G'] = 'https://go.dev/talks/2013/bestpractices.slide#1'
bookmarks['H'] = 'https://chat.openai.com/';
bookmarks['I'] = 'https://chat.instage.ai/ko';
bookmarks['J'] = 'https://github.com/shsheep/Journey_to_summit/tree/master/Leetcode';
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
bookmarks['1'] = 'https://www.11st.co.kr/';
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
