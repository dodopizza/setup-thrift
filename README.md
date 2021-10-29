# Setup Apache Thrift Github Action

## Inputs

### `version`

Thrift version e.g. `0.15.0`

## Example usage

```yaml
- name: Setup thrift
  uses: dodopizza/setup-thrift@v1
  with:
    version: 0.15.0

- name: Generate code
  run: |
    thrift --gen netstd -o ./nuget/Pay.Specs -strict -r ./src/plugin.thrift
```
