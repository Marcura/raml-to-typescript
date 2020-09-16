# RAML to typescript

This project is a schema downloading tool for generating DTO in typescript

## Project initialization

Run `composer install` to init vendors package required by this project.

## Downloading schema

Run `php download-schema <namespace> <raml-url> <output-directory='./dist'> <overrides-file-path>` to generate typescript DTO files.
Parameters:
* `namespace` typescript namespace that will be used for dto files,
* `raml-url` url to raml file that contains list of schemas, this parameter can be also a direct link to schema,
* `output-directory` (optional) path to directory in which generated files will be stored,
* `overrides-file-path` (optional) path to file that contains definition of files that shouldn't be generated.

Example `overrides.json`:
```
{
  "http://schemas2.dev.marcura.com/1.1/json/schemas/common/id-name-object.schema.json": {
    "path": "@marcura/marcura-common",
    "name": "IdNameDto"
  },
  "http://schemas2.dev.marcura.com/1.1/json/schemas/common/id-object.schema.json": {
    "path": "@marcura/marcura-common",
    "name": "IdDto"
  },
  "http://schemas2.dev.marcura.com/1.1/json/schemas/common/string-id-name-object.schema.json": {
    "path": "@marcura/marcura-common",
    "name": "IdNameDto<string>",
    "importName": "IdNameDto"
  }
}

```

## Requirements

* PHP 7.0 or higher
* [composer](https://getcomposer.org/)
