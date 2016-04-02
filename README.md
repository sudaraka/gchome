# gchome

Run garbage collect on all `git` repositories found under `$HOME`.


**Note:**
- Developed and targeted for Linux platform, should work in BSD/OSX as well.
- This application is distributed via `npm`, however **this is not a Node.js
  application**.

## Install

As npm script:

`npm install gchome`

As global command:

`sudo npm install -g gchome`

After this `gchome` should be available in your CLI.

Note: `sudo` maybe optional depending on your npm setup.

## Usage

As npm script:

Include following in your `package.json`

```json
"scripts": {
  "gchome": "gchome"
}
```

then,

`npm run gchome`


## History

Started as a shell script that recursively rung `git gc --prune=0` on the my
projects directory back in 2014.

Eventually expanded the include more directories and finally covering all git
repositories the script can find (recursively) inside `$HOME`.

## License

Copyright 2016 Sudaraka Wijesinghe <sudaraka@sudaraka.org>

This program comes with ABSOLUTELY NO WARRANTY;
This is free software, and you are welcome to redistribute it and/or modify it
under the terms of the BSD 2-clause License. See the LICENSE file for more
details.
