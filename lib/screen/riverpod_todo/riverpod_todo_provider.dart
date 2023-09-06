import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum TodoListFilter {
  all,
  active,
  completed,
}

/// The currently active filter.
///
/// We use [StateProvider] here as there is no fancy logic behind manipulating
/// the value since it's just enum.
final todoListFilter = StateProvider((_) => TodoListFilter.all);

/// 미완료된 todo의 수
///
/// [Provider]를 사용함으로써, 이 값은 캐시되어 성능이 향상됩니다.
/// 여러 위젯이 완료되지 않은 할 일의 수를 읽으려고 시도할 때도,
/// 이 값은 할 일 목록이 변경될 때까지 한 번만 계산됩니다.
///
/// 할 일 목록이 변경되어도 완료되지 않은 할 일의 수가 변경되지 않으면
/// (예: 할 일을 편집할 때와 같이) 불필요한 재구성도 최적화됩니다.
///
/// Provider는 이외에도 싱글턴 객체를 제공할 때 주로 쓰인다. 그때는 ref.watch가 필요 없다.
final uncompletedTodosCount = Provider<int>((ref) {
  // return SingletonObj();
  // watch가 없으면 싱글턴 객체
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

/// [todoListFilter]를 적용한 후의 할 일 목록입니다.
///
/// 이것 역시 [Provider]를 사용하여, 필터나 할 일 목록이 업데이트되지 않는 한
/// 필터링된 목록을 다시 계산하는 것을 피하기 위해 사용됩니다.
final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
      return todos;
  }
});

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList(const [
    Todo(id: 'todo-0', description: 'hi'),
    Todo(id: 'todo-1', description: 'hello'),
    Todo(id: 'todo-2', description: 'bonjour'),
  ]);
});

// List를 이렇게 다루는게 내게는 어색하다.
class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  // 어색한 방식.
  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

@immutable
class Todo {
  const Todo({
    required this.description,
    required this.id,
    this.completed = false,
  });

  final String id;
  final String description;
  final bool completed;

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}
