# flutter_hook_try_out

A new Flutter project.

## TODO

- Trying flutter hook in [simple state management](#simple-state-management) (Counter App)
- Trying flutter hook in [medium state management](#medium-state-management) (Todo App)
- Integrate flutter hook with other state management (Provider, Riverpod, GetX)
- Make a docs about the journey.

## Simple state management

Create a simple state management with counter app
> lib/counter_app/counter_app.dart

- Simply increase the state on tap and update the rendering real time
- React like hook, reduce time to write life cycle function
- The widget must extends from `HookWidget`
- Hooks can only be declare in the `build` method

> Seem like a bit slow on `useState`. Because under the hood the state value is `ValueNotifier` and when it changes, it also calls `setState`

## Medium state management

> lib/todo_app/todo_app.dart

- `useEffect` works as expected. It will run on every render only when any of the dependencies​ changes theirs value.
- If you want to update state of `useState` that hold array value, you need to do it with spread. E.g.:
  ```dart
    numbers.value = [
      ...numbers.value.add(5),
    ];
  ```
- Use `useTextEditingController` to create an instance of `TextEditingController`. It's self disposed. Great for reusable. Can create a custom hook out of it.
