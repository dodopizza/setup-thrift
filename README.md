# Apache Thrift Compiler Github Action

## Inputs

### `args`

Args to pass to thrift. e.g. `./src/plugin.thrift`

## Example usage

```yaml
uses: dodopizza/thrift-action@v1
with:
  args: --gen netstd -o ./nuget/Pay.Specs -strict -r ./src/plugin.thrift
```
