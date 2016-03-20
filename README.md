# gchome

Run garbage collect on all `git` repositories found under `$HOME`.

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
