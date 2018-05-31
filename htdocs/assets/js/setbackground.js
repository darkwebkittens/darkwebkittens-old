// Thanks to this StackOverflow post for the random BG code:
// https://stackoverflow.com/a/25390248

function setBackground(urls, targetId) {
    setInterval(function() {
        var index = Math.floor(Math.random() * (urls.length));
        var target = document.getElementById(targetId);
        target.style.backgroundImage = "linear-gradient(to top, rgba(19, 21, 25, 0.5), rgba(19, 21, 25, 0.5)), url(" + urls[index] + ")";
        
    }, 5000);
}

var urls = [
    '/images/cats/12374386085_f4d7aa323d_o.jpg',
    '/images/cats/14160829306_c95e8b9419_o.jpg',
    '/images/cats/14895989825_3a67152d05_o.jpg',
    '/images/cats/15218475961_ec511e8828_o.jpg',
    '/images/cats/15745379826_08ab0f912f_o.jpg',
    '/images/cats/16075613156_99253f22a0_o.jpg',
    '/images/cats/28466850754_c186e16436_o.jpg',
    '/images/cats/29842350045_e8c296a151_o.jpg',
    '/images/cats/31898737835_1831fa4a5e_o.jpg',
    '/images/cats/4137352612_925ff0847b_o.jpg',
    '/images/cats/4576725680_e5b9c5db74_o.jpg',
    '/images/cats/4646845537_7fcb17d381_o.jpg',
    '/images/cats/4671107278_912041d31c_o.jpg',
    '/images/cats/5264164625_ca7a3847d7_o.jpg',
    '/images/cats/6117272430_d59422f652_o.jpg',
    '/images/cats/6145248102_526996c041_o.jpg',
    '/images/cats/6157871473_3b4be04091_o.jpg',
    '/images/cats/6651575581_595b56bf78_o.jpg',
    '/images/cats/6830173403_6ba9a252a4_o.jpg',
    '/images/cats/8312161062_5bb567a08c_o.jpg',
    '/images/cats/8560840635_89eba45401_o.jpg',
    '/images/cats/8669890808_cd2424d9d7_o.jpg',
    '/images/cats/8726415925_a0634bf464_o.jpg',
    '/images/cats/891765178_ada159369e_o.jpg',
    '/images/cats/9233486351_03998e0201_o.jpg',
];

// Here we set the target CSS property for the background
// image switcher to change.
var target = "bg";

setBackground(urls, target);
