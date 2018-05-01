# digest-plus.cr

Adds common digests by wrapping OpenSSL.

Note: This library is **NOT** thread-safe.


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  digest+:
    github: chris-huxtable/digest-plus.cr
```


## Usage

```crystal
require "digest+"
```

Adds the following digests by wrapping the OpenSSL interface.

- `Digest::SHA224`
- `Digest::SHA256`
- `Digest::SHA384`
- `Digest::SHA512`
- `Digest::Whirlpool`

Adds a `file` class method to `Digest::Base`.


## Contributing

1. Fork it ( https://github.com/chris-huxtable/digest-plus.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Chris Huxtable](https://github.com/chris-huxtable) - creator, maintainer
