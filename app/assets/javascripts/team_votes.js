$(document).ready(function() {
  var users = gon.users;
  var images = gon.images;
  var already_won = [];
  $('.winner-btn').click(
    function(btn){
      var total = users.length;
      var index = Math.round(Math.random()*total);;
      while(!$.inArray(index, already_won)){
        index = Math.round(Math.random()*total);
      }
      var content = '<p>' + users[index] + '</p>';
      content = content + '<img src ="'+ getImage(images[index])+'">';
      $(this).html(content);
      $(this).removeClass('btn-primary');
      $(this).addClass('btn-success');
    }
  );

  function getImage(uid){
    return 'http://graph.facebook.com/v2.6/'+uid+ '/picture?width=100&height=100';
  }
  var navigation = null;
  (navigation = document.getElementById('navigation-container')).parentNode.removeChild(navigation);
  
  var el = frzr.el;
  var mount = frzr.mount;
  var unmount = frzr.unmount;
  var List = frzr.List;
  
  var data = new Array(users.length);
  var wrapper = el('div', {class: 'item-wrapper'});

  function Item () {
    this.el = el('div', { class: 'item' },
      this.name = el('p')
    );
  }

  Item.prototype.update = function (data) {
    this.data = data;
    this.name.textContent = data.name;
  }

  var list = animatedList(Item, 'id');

  updateData();

  setInterval(function () {
    updateData();
  }, 800);


  mount(document.getElementById("item-wrapper"), list);

  function updateData () {
    for (var i = 0; i < users.length; i++) {
      data[i] = {
        id: i,
        name: users[i]
      }
    }
    data.sort(function () {
      return Math.random() - .5;
    });
    data.length = Math.random() * 30 + 30 | 0;
    list.update(data);
  } 


});