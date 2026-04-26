Sublime Text 4205 py314 host crashes when loading compiled plugin.

## Steps

1. Install [uv](https://github.com/astral-sh/uv).

2. Compile the plugin
   - Linux x64: Run `$ make build-lib-cp314-linux-x86_64`
   - Windows x64: Run `$ make build-lib-cp314-windows-x86_64`

   The built file will be in `build/`.

3. Copy the compiled plugin
   - Linux x64: `test_module.cpython-314-x86_64-linux-gnu.so`
   - Windows x64: `test_module.cp314-win_amd64.pyd`

   to the Sublime Text `Packages` directory.

4. In Sublime Text, open the console (Ctrl+\`) and run `import test_module`.
5. Sublime Text py314 plugin host crashes.

## Expected behavior

If you run an external Python in `build/` and do `import test_module`, it works without crashing. The same should be true in Sublime Text.

```py
[jfcherng build](main)$ python
Python 3.14.4 (tags/v3.14.4:23116f9, Apr  7 2026, 14:10:54) [MSC v.1944 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> import test_module
>>> test_module.mask_numbers('a1b2c3')
'a*b*c*'
>>>
```
