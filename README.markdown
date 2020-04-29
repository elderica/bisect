# Bisect

Bisection algorithms.

## Usage

This library is a port of Python's [bisect](https://docs.python.org/3/library/bisect.html) module to Common Lisp.  
See Python's docs for usage.

```common-lisp
(bisect:bisect-right seq x &optional (lo 0) (hi (length seq))) => integer
(bisect:bisect-left seq x &optional (lo 0) (hi (length seq))) => integer
(bisect:insort-right seq x &optional (lo 0) (hi (length seq))) => sequence
(bisect:insort-left seq x &optional (lo 0) (hi (length seq))) => sequence
```

## Installation

Just `git clone https://github.com/sbwhitecap/bisect.git ~/common-lisp/bisect`
