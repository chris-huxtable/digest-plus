# Copyright (c) 2018 Christian Huxtable <chris@huxtable.ca>.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

require "spec"
require "../src/digest+"

describe Digest::SHA224 do

  it "works" do
    message = "The quick brown fox jumps over the lazy dog"
    Digest::SHA224.hexdigest(message).should eq("730e109bd7a8a32b1cb9d9a09aa2325d2430587ddbc0c38bad911525")
  end

  it "works with empty string" do
    Digest::SHA224.hexdigest("").should eq("d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f")
  end

end

describe Digest::SHA256 do

  it "works" do
    message = "The quick brown fox jumps over the lazy dog"
    Digest::SHA256.hexdigest(message).should eq("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592")
  end

  it "works with empty string" do
    Digest::SHA256.hexdigest("").should eq("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  end

end

describe Digest::SHA384 do

  it "works" do
    message = "The quick brown fox jumps over the lazy dog"
    Digest::SHA384.hexdigest(message).should eq("ca737f1014a48f4c0b6dd43cb177b0afd9e5169367544c494011e3317dbf9a509cb1e5dc1e85a941bbee3d7f2afbc9b1")
  end

  it "works with empty string" do
    Digest::SHA384.hexdigest("").should eq("38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b")
  end

end

describe Digest::SHA512 do

  it "works" do
    message = "The quick brown fox jumps over the lazy dog"
    Digest::SHA512.hexdigest(message).should eq("07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6")
  end

  it "works with empty string" do
    Digest::SHA512.hexdigest("").should eq("cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e")
  end

end

describe Digest::Whirlpool do

  it "works" do
    message = "The quick brown fox jumps over the lazy dog"
    Digest::Whirlpool.hexdigest(message).should eq("b97de512e91e3828b40d2b0fdce9ceb3c4a71f9bea8d88e75c4fa854df36725fd2b52eb6544edcacd6f8beddfea403cb55ae31f03ad62a5ef54e42ee82c3fb35")
  end

  it "works with empty string" do
    Digest::Whirlpool.hexdigest("").should eq("19fa61d75522a4669b44e39c1d2e1726c530232130d407f89afee0964997f7a73e83be698b288febcf88e3e03c4f0757ea8964e59b63d93708b138cc42a66eb3")
  end

end
