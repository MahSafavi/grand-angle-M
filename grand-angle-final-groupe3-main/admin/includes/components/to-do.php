


<h2>A faire :</h2>
  <div class="todo-input-grid">
    <input type="text" placeholder="Écrivez..." class="js-name-input name-input">
    <input type="date" class="js-input-due-date date-input">
    <button onclick="addToDo();" class="add-btn">Ajouter</button>
  </div>
  <div class="js-todo-list todo-grid"></div>





  <script>
    const todoList = [];

renderTodoList();

function renderTodoList() {
  let todoListHTML = '';
  todoList.forEach(function (todoObject, index) {

    const { name, dueDate } = todoObject;
    const html = `<div>${name}</div> 
    <div> ${dueDate}</div>
    <button onclick="
    todoList.splice(${index},1);
    renderTodoList();
    " class="del-btn">Supprimer</button>`;


    todoListHTML += html;
  }
  );

  document.querySelector('.js-todo-list').innerHTML = todoListHTML;
}

function addToDo() {
  const inputElement = document.querySelector('.js-name-input');
  const name = inputElement.value;
  const dateInputElement = document.querySelector('.js-input-due-date');
  const dueDate = dateInputElement.value
  todoList.push({ name, dueDate });
  inputElement.value = '';
  renderTodoList();
}
  </script>