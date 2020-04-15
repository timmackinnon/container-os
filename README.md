This repository contains a simple script that can introspect the running in-container Operating System version.

The output will look something like:
```
<container A> is running <os B>
<container C> is running <os D>
...
```

To look for non-standard OSs:
```
./os_in_container.sh >> os.log
cat os.log | grep rogue
```

To do some fun OS variant counting for containers, you can try:
```
./os_in_container.sh >> os.log
cat os.log | cut -d' ' -f4- | sort | uniq -c
```
