# MIA Object Rights types

I want to get a good idea of which of our objects are public domain and
copyright protected. Of the copyright protected images, some we have
rights to use in high resolution on our website; others we don't.

`csvstat rights.csv` says:

```
ObjRightsType
  5 most frequent values:
  Public Domain:  60628
  Need Permission:        11546
  Copyright Protected:    7077
  Full Permission:        4713
  Non-Commercial Use:     3212
```

That only shows the top 5, so `csvcut -c2 rights.csv | tail -n+2 | sort | uniq -c`

```
7077 Copyright Protected
4713 Full Permission
11546 Need Permission
3212 Non-Commercial Use
 777 Online Use Only
   3 Permission Denied
1176 Permission with Restrictions
60628 Public Domain
```
