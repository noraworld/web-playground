$(function() {

  //「もっと読む」ボタンによる文章のスライドダウン
  $('#read-more').click(function(){
    $('#more-text').slideDown();
    $(this).hide();
  });

  //「.gallery-item」のhoverによる説明の表示/非表示
  $('.gallery-item').hover(
    function(){
      $(this).children('.gallery-cover').fadeIn();
    },
    function(){
      $(this).children('.gallery-cover').fadeOut();
    }
  );

  //SNSボタンのアニメーション
  $('.sns-list').find('li').hover(
    function(){
      $(this).animate({'font-size':'20px'});
    },
    function(){
      $(this).animate({'font-size':'14px'});
    }
  );

  //「学ぶ」タブが押されたときに
  //「#language-list」が「hide-list」クラスを持っていたらそれを外し
  //持っていなかったら追加してください


});
