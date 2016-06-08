$(document).ready(function() {

  
  var navigation = null;
  (navigation = document.getElementById('navigation-container')).parentNode.removeChild(navigation);
  
  var el = frzr.el;
  var mount = frzr.mount;
  var unmount = frzr.unmount;
  var List = frzr.List;
  var users = gon.users;
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