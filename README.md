# msfiles-selector

A small bash script to subset files from a larger directory if they contain a given pattern

### make it executable 


```bash
cd ./src
chmod +x copy_files.sh
```

### Run

```bash
./copy_files.sh -i /path/to/input_folder -o /path/to/output_folder -p "*.mzML"
```

Example

```bash
./copy_files.sh -i /media/share/mapp/public/QE_plus_unifr/converted -o /media/share/mapp/public/QE_plus_unifr/tmp -p "20240405_CVOL_*.mzML"
```
