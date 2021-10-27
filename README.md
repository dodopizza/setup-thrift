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

```
- name: Download
  working-directory: ./download
  run: |
    oras pull ghcr.io/dodopizza/thrift-action/binaries:1.0 \
      --media-type application/vnd.unknown.layer.v1+tar.gz \
    && tar zxf ./thrift.${{ matrix.version }}.tar.gz -C . \
    && ls -laR .
```