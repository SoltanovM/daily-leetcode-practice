# Testing in Python: A Beginner-Friendly Guide

This guide is for learning testing from zero.

If you are new, the most important thing to know is this:

Testing means writing code that checks whether your other code behaves correctly.

A test gives you confidence that:

- your code works today
- future changes do not break old behavior
- bugs are easier to catch early
- refactoring becomes safer

---

## 1. What is a test?

A test is a small piece of code that:

1. sets up some input
2. runs your function, method, class, or module
3. checks that the output or behavior matches what you expect

Simple example:

```python
def add(a, b):
    return a + b


def test_add():
    assert add(2, 3) == 5
```

This says:

- call `add(2, 3)`
- expect the result to be `5`

If the result is not `5`, the test fails.

---

## 2. Why testing matters

Without tests:

- you manually re-check everything
- bugs come back easily
- changing code feels risky
- large projects become stressful

With tests:

- you can make changes faster
- you catch regressions early
- code is easier to trust
- debugging becomes more focused

---

## 3. Main kinds of tests

You will hear these terms often:

### Unit tests

A unit test checks one small piece of code in isolation.

Usually this means:

- one function
- one method
- one class behavior

Example:

```python
def multiply(a, b):
    return a * b


def test_multiply():
    assert multiply(4, 5) == 20
```

This is a unit test because it checks one small unit of logic.

Use unit tests for:

- functions
- helpers
- class methods
- pure logic
- edge cases

### Integration tests

An integration test checks whether multiple parts work together correctly.

Examples:

- a function talking to a database
- a service calling an API client
- reading a file and transforming its data
- multiple classes working together

Example idea:

```python
def test_save_user_to_database():
    user = User(name="Ana")
    repo = UserRepository(database_connection)
    repo.save(user)

    saved_user = repo.get_by_name("Ana")
    assert saved_user.name == "Ana"
```

This is integration testing because more than one part is involved:

- `User`
- `UserRepository`
- database connection

### End-to-end tests

These simulate a real user flow from start to finish.

Examples:

- opening a website, logging in, and submitting a form
- sending an HTTP request to your app and checking the response

These are broader and slower than unit tests.

### Regression tests

A regression test is a test added to prevent an old bug from coming back.

Typical workflow:

1. bug happens
2. write a test for the bug
3. fix the bug
4. keep the test forever

### Smoke tests

These are a few basic tests that check whether the system is alive and usable.

Example:

- app starts
- main page loads
- database connection works

---

## 4. Unit test vs integration test

This is one of the biggest beginner questions.

### Unit test

- small scope
- fast
- isolated
- easy to debug

Example:

```python
def discount(price, percent):
    return price - (price * percent / 100)


def test_discount():
    assert discount(100, 10) == 90
```

### Integration test

- larger scope
- checks collaboration between parts
- often slower
- may use database, filesystem, API, or framework components

Example:

```python
def test_user_service_creates_and_saves_user():
    db = FakeDatabase()
    service = UserService(db)

    user = service.create_user("Maria")

    assert db.users[0].name == "Maria"
    assert user.name == "Maria"
```

### Easy rule

Ask yourself:

- "Am I testing one piece of logic by itself?" -> Unit test
- "Am I testing multiple pieces working together?" -> Integration test

---

## 5. Should you use `pytest`?

Yes, in most modern Python projects, `pytest` is the best starting point.

Why beginners like `pytest`:

- simple syntax
- very readable
- easy assertions
- powerful fixtures
- parameterized tests are easy
- huge ecosystem

Python also has built-in `unittest`, which is absolutely valid, but `pytest` is usually easier to learn and nicer to write.

### Recommendation

If you are starting fresh:

- use `pytest`

If you join an older codebase:

- follow whatever testing style the project already uses

---

## 6. Installing `pytest`

```bash
pip install pytest
```

Run tests with:

```bash
pytest
```

Run one file:

```bash
pytest tests/test_math_utils.py
```

Run one test:

```bash
pytest tests/test_math_utils.py -k add
```

---

## 7. Basic `pytest` structure

A common project layout:

```text
my_project/
├── app/
│   ├── __init__.py
│   ├── math_utils.py
│   └── users.py
└── tests/
    ├── test_math_utils.py
    └── test_users.py
```

Example app code:

```python
# app/math_utils.py
def add(a, b):
    return a + b
```

Example test:

```python
# tests/test_math_utils.py
from app.math_utils import add


def test_add():
    assert add(2, 3) == 5
```

Naming matters:

- test files usually start with `test_`
- test functions usually start with `test_`

This helps `pytest` discover tests automatically.

---

## 8. The basic test pattern: Arrange, Act, Assert

Most tests follow this structure:

### Arrange

Prepare data and objects.

### Act

Run the code being tested.

### Assert

Check the result.

Example:

```python
def divide(a, b):
    return a / b


def test_divide():
    # Arrange
    a = 10
    b = 2

    # Act
    result = divide(a, b)

    # Assert
    assert result == 5
```

This pattern keeps tests readable.

---

## 9. How to test functions

Functions are the easiest place to start.

Example:

```python
def is_even(number):
    return number % 2 == 0
```

Tests:

```python
def test_is_even_with_even_number():
    assert is_even(4) is True


def test_is_even_with_odd_number():
    assert is_even(5) is False
```

What to test for functions:

- normal case
- edge case
- invalid input if relevant
- boundary values

---

## 10. How to test classes

You usually test class behavior through its methods.

Example class:

```python
class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
```

Tests:

```python
import pytest


def test_deposit_increases_balance():
    account = BankAccount(100)

    account.deposit(50)

    assert account.balance == 150


def test_withdraw_decreases_balance():
    account = BankAccount(100)

    account.withdraw(40)

    assert account.balance == 60


def test_withdraw_raises_error_when_balance_is_too_low():
    account = BankAccount(100)

    with pytest.raises(ValueError):
        account.withdraw(150)
```

What you are testing:

- the class state changes correctly
- methods produce expected results
- invalid situations raise correct errors

---

## 11. How to test exceptions

If code should raise an exception, test that explicitly.

Example:

```python
import pytest


def divide(a, b):
    if b == 0:
        raise ValueError("b cannot be zero")
    return a / b


def test_divide_by_zero_raises_value_error():
    with pytest.raises(ValueError):
        divide(10, 0)
```

You can also check the message:

```python
def test_divide_by_zero_message():
    with pytest.raises(ValueError, match="zero"):
        divide(10, 0)
```

---

## 12. How to test multiple inputs with `parametrize`

This is one of the best `pytest` features.

Example:

```python
import pytest


@pytest.mark.parametrize(
    ("a", "b", "expected"),
    [
        (2, 3, 5),
        (10, 5, 15),
        (-1, 1, 0),
    ],
)
def test_add(a, b, expected):
    assert a + b == expected
```

Why this is good:

- less repeated code
- easier to read
- easier to add more cases

This is exactly what you used in your `two sum` example.

---

## 13. How to test Python modules and packages

### Testing a module

If you have:

```text
app/
└── calculator.py
```

And inside:

```python
def add(a, b):
    return a + b
```

Then your test can be:

```python
from app.calculator import add


def test_add():
    assert add(1, 2) == 3
```

### Testing a package

If your package is:

```text
app/
├── __init__.py
├── calculator.py
└── formatter.py
```

You can test each module separately:

```text
tests/
├── test_calculator.py
└── test_formatter.py
```

This is usually the cleanest structure.

### Good habit

Keep your tests close in meaning to the module they test.

For example:

- `app/users.py` -> `tests/test_users.py`
- `app/orders.py` -> `tests/test_orders.py`

---

## 14. How imports usually work in tests

Common style:

```python
from app.users import create_user
```

If imports fail, the project structure or environment may need adjustment.

Many projects run tests from the project root:

```bash
pytest
```

That is the normal workflow.

---

## 15. What makes a good test?

A good test is:

- small
- clear
- focused
- repeatable
- fast
- easy to understand

If someone reads a test, they should quickly understand:

- what behavior is being tested
- what input is used
- what output is expected

---

## 16. Best practices

Here are the most useful best practices for beginners.

### 1. Test behavior, not implementation details

Bad idea:

- testing private internal steps too closely

Better idea:

- test what the code does from the outside

Example:

- good: "returns the right total"
- less good: "uses variable `x` and loop `y` internally"

Why:

- implementation details change often
- behavior matters more

### 2. Keep tests independent

Each test should run by itself.

One test should not depend on another test running before it.

Bad:

- test B only passes if test A created some state

Good:

- each test creates its own data

### 3. Use descriptive names

Good names:

- `test_withdraw_raises_error_when_balance_is_too_low`
- `test_two_sum_returns_indices_for_matching_pair`

Bad names:

- `test_1`
- `test_function`

### 4. Test one thing per test when possible

This makes failures easier to understand.

### 5. Cover happy path and edge cases

For example, if testing string input:

- normal string
- empty string
- special characters
- invalid input if relevant

### 6. Do not over-mock

Mocking means replacing a real dependency with a fake one.

It is useful, but beginners often use too much mocking.

If possible:

- test simple logic directly
- use mocks only when a real dependency is slow, external, or hard to control

### 7. Keep tests fast

Fast tests get run more often.

If tests are slow, people avoid them.

### 8. Use fixtures for repeated setup

If many tests need the same object, use a fixture.

Example:

```python
import pytest


@pytest.fixture
def account():
    return BankAccount(100)


def test_deposit(account):
    account.deposit(50)
    assert account.balance == 150


def test_withdraw(account):
    account.withdraw(40)
    assert account.balance == 60
```

### 9. Keep production code testable

Testable code is usually:

- small
- modular
- not tightly coupled
- clear in inputs and outputs

If a function is extremely hard to test, that often means it is doing too much.

### 10. When you fix a bug, add a test

This is one of the best habits you can build.

---

## 17. Common beginner mistakes

### Writing tests that are too large

If one test checks many unrelated things, failures become confusing.

### Testing trivial Python behavior

Do not test Python itself.

Example:

- you do not need to test that `len([1, 2, 3]) == 3`

Test your logic, not built-in language behavior.

### Writing fragile tests

Fragile tests fail for the wrong reasons.

Examples:

- depending on exact formatting that changes often
- depending on test order
- depending on current time without controlling it

### Ignoring failure messages

When a test fails, read:

- actual result
- expected result
- traceback

The failure output is very helpful.

---

## 18. `pytest` fixtures explained simply

Fixtures are reusable setup helpers.

Instead of repeating setup in many tests, create one fixture and reuse it.

Example:

```python
import pytest


class Cart:
    def __init__(self):
        self.items = []

    def add(self, item):
        self.items.append(item)


@pytest.fixture
def cart():
    return Cart()


def test_cart_starts_empty(cart):
    assert cart.items == []


def test_add_item(cart):
    cart.add("Book")
    assert cart.items == ["Book"]
```

Why fixtures help:

- less duplication
- cleaner tests
- easier maintenance

---

## 19. Mocking: what it is and when to use it

Mocking means replacing a real dependency with a fake one during testing.

Use mocking when your code depends on:

- external API calls
- databases
- email sending
- payment systems
- current time
- random values

Example idea:

Instead of actually calling a live API, you fake the API response.

This makes tests:

- faster
- more reliable
- not dependent on internet or external services

Example with `unittest.mock`:

```python
from unittest.mock import Mock


def test_send_notification():
    fake_email_service = Mock()

    notifier = Notifier(fake_email_service)
    notifier.send("hello@example.com", "Welcome")

    fake_email_service.send.assert_called_once_with(
        "hello@example.com",
        "Welcome",
    )
```

Important:

- mock dependencies, not the logic you are trying to test

---

## 20. When to use real dependencies vs fake ones

### Use real objects when

- logic is simple
- setup is easy
- dependency is stable and fast

### Use fake or mocked dependencies when

- dependency is external
- dependency is slow
- dependency is expensive
- dependency is hard to control

Good testing strategy:

- many unit tests with isolated logic
- fewer integration tests with real collaboration between components

---

## 21. Testing file operations

If your code reads or writes files, test carefully.

Example:

```python
def save_text(path, text):
    with open(path, "w", encoding="utf-8") as file:
        file.write(text)
```

With `pytest`, you can use temporary directories.

Example:

```python
def test_save_text(tmp_path):
    file_path = tmp_path / "note.txt"

    save_text(file_path, "hello")

    assert file_path.read_text(encoding="utf-8") == "hello"
```

`tmp_path` is a very useful built-in fixture.

---

## 22. Testing API or web apps

If you later work with Flask, FastAPI, or Django, you will test:

- routes
- responses
- status codes
- JSON bodies
- authentication behavior

Example idea:

```python
def test_get_users_returns_200(client):
    response = client.get("/users")
    assert response.status_code == 200
```

This is usually closer to integration testing because frameworks and routing are involved.

---

## 23. How much should you test?

Beginners often ask:

"Do I need 100% coverage?"

Short answer:

- no

Focus first on testing important behavior:

- core business logic
- critical paths
- edge cases
- past bugs

Coverage tools can help, but high coverage does not always mean high quality.

A bad test suite can have high coverage.

---

## 24. What is code coverage?

Coverage tells you how much of your code is executed by tests.

Example:

- if your tests run 80 out of 100 lines, coverage is 80%

Useful idea:

- coverage is a signal, not a goal by itself

Good question:

- "Are the important behaviors tested?"

Better than:

- "Did I hit every line?"

---

## 25. Organizing tests in real projects

A common layout:

```text
project/
├── src/
│   └── my_package/
│       ├── __init__.py
│       ├── users.py
│       └── billing.py
└── tests/
    ├── unit/
    │   ├── test_users.py
    │   └── test_billing.py
    └── integration/
        └── test_user_billing_flow.py
```

This is useful when your project grows.

For small projects, a simple `tests/` folder is enough.

---

## 26. `unittest` vs `pytest`

### `unittest`

- built into Python
- class-based style is common
- more verbose

Example:

```python
import unittest


class TestAdd(unittest.TestCase):
    def test_add(self):
        self.assertEqual(2 + 3, 5)
```

### `pytest`

- external package
- simpler syntax
- less boilerplate
- richer developer experience

Example:

```python
def test_add():
    assert 2 + 3 == 5
```

### Beginner recommendation

Learn `pytest` first.
Later, learn enough `unittest` to read older codebases.

---

## 27. How this applies to your LeetCode-style files

Suppose you have:

```python
class MySolution:
    def twoSum(self, nums, target):
        ...
```

Then a test should call that method and compare the result:

```python
def test_two_sum_example_1():
    assert MySolution().twoSum([2, 7, 11, 15], 9) == [0, 1]
```

That is a unit test because:

- you are testing one algorithm
- there are no external systems involved

If you test many inputs:

```python
import pytest


@pytest.mark.parametrize(
    ("nums", "target", "expected"),
    [
        ([2, 7, 11, 15], 9, [0, 1]),
        ([3, 2, 4], 6, [1, 2]),
        ([3, 3], 6, [0, 1]),
    ],
)
def test_two_sum(nums, target, expected):
    assert MySolution().twoSum(nums, target) == expected
```

This is a clean, professional testing pattern.

---

## 28. A simple testing workflow

When you write new code:

1. write the function or class
2. run it manually once if needed
3. write tests for expected behavior
4. run `pytest`
5. fix failures
6. refactor safely

When you find a bug:

1. reproduce the bug
2. write a failing test
3. fix the code
4. run tests again

That workflow will help you improve fast.

---

## 29. What to test first as a beginner

Start with:

- simple utility functions
- algorithms
- class methods with clear input/output
- validations
- error handling

Do not start with:

- complex mocking-heavy systems
- deep framework internals
- giant end-to-end setups

Build confidence step by step.

---

## 30. Beginner cheat sheet

### If you are testing...

- one function -> unit test
- one method -> unit test
- one class behavior -> usually unit test
- function + database -> integration test
- API route + database + auth -> integration or end-to-end test
- full user journey -> end-to-end test

### Best tool for most Python beginners

- `pytest`

### Best habits

- keep tests small
- name tests clearly
- test behavior
- cover edge cases
- add tests for bugs you fix
- keep tests independent

---

## 31. Example of a clean beginner-friendly test file

```python
import pytest
from app.calculator import divide


def test_divide_returns_expected_result():
    assert divide(10, 2) == 5


def test_divide_handles_negative_numbers():
    assert divide(-10, 2) == -5


def test_divide_by_zero_raises_error():
    with pytest.raises(ValueError):
        divide(10, 0)
```

Why this is good:

- easy to read
- focused
- tests normal and error behavior

---

## 32. Final advice

If you remember only a few things, remember these:

1. Testing is code that checks your code.
2. Unit tests check small pieces in isolation.
3. Integration tests check multiple parts working together.
4. `pytest` is usually the best choice for beginners in Python.
5. Good tests are small, clear, and independent.
6. When you fix a bug, add a test for it.
7. Testing gets easier the more modular your code is.

You do not need to learn everything at once.

A strong learning path is:

1. learn simple `assert` tests
2. learn `pytest`
3. learn `parametrize`
4. learn fixtures
5. learn exceptions testing
6. learn mocking
7. learn integration testing

That order works very well for most beginners.

---

## 33. A tiny action plan for you

If you want to practice right now:

1. pick one small Python file
2. write 3 tests for it
3. cover one normal case
4. cover one edge case
5. cover one error case

That is enough to build real skill.
