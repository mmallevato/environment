# Format code

## Follow rules

### 1.  Add space between every line, except lines within an expression or import statement group.

```python
import sys

import numpy as np # No space below because same import statement group
import pandas as pd

x = 10

y = function( # No space below because same expression
  a,
  b,
  c,
  )
```

### 2.  Split iterables with length >1 into separate lines and add comma after last item.

```python
x = [
  1,
  2,
  3, # Comma after last item
  ]

y = function( # Parameters in function call are considered an iterable here
  range(
    1,
    10,
    ),
  x,
  'Title', # Comma after last item
  )
```

### 3.  Dont split long lines, there's no character limit.

```python
long_variable_name = long_matrix_name.loc[rows.index[1000:2000], ~long_matrix_name.columns.duplicated()]
```

### 4.  Include optional arguments.

```python
function(
  required_argument,
  optional_argument_1='a', # Instead of just `a`
  optional_argument_2='b', # Instead of just `b`
  optional_argument_3='c', # Instead of just `c`
  )

x = 'a-b-c'.split(sep='-') # .split() will work without `sep=`, but its an optional argument so `sep=` is included
```

### 5.  Add comma and space to tuple with one item.

```python
x = (1, )
```

### 6.  Add space after colons in dictionary.

```python
x = {
  'a': 1,
  'b': 2,
  'c': 3,
  }
```

### 7.  Use `.format()` to combine strings.

```python
x = '{} and {}'.format('this', 'that') # To make 'this and that'
```

### 8.  Use `.split()` to split strings.

```python
x = 'a-b-c'.split(sep='-') # To make 'a', 'b', 'c'
```
