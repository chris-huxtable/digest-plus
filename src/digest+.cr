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

require "openssl"
require "digest"


abstract class Digest::Base::OpenSSL < Digest::Base
	@ctx : ::OpenSSL::Digest
	@digest : Bytes?

	protected def self.new()
		new(shared_context())
	end

	protected def initialize(@ctx : ::OpenSSL::Digest)
		@ctx.reset
	end

	def update(data : String|Bytes) : self
		raise "Digester was finalized" if ( @digest )
		@ctx.update(data)
		return self
	end

	def result() : Bytes
		final()

		digest = @digest
		return digest if ( digest )

		raise "Internal inconsistency"
	end

	def final() : Nil
		return if ( @digest )
		@digest = @ctx.digest

		@ctx.reset
	end

	protected def self.shared_context() : ::OpenSSL::Digest
		raise "Only supported in subclasses"
	end

end

class Digest::Base
	def self.file(file_name)
		context = new
		File.open(file_name) { |io| context.update(io) }
		context.final
		context.result
	end
end

class Digest::SHA224 < Digest::Base::OpenSSL
	@@digestor : ::OpenSSL::Digest?

	protected def self.shared_context() : ::OpenSSL::Digest
		digestor = @@digestor
		return digestor if ( digestor )

		digestor = ::OpenSSL::Digest.new("SHA224")

		@@digestor = digestor
		return digestor
	end
end

class Digest::SHA256 < Digest::Base::OpenSSL
	@@digestor : ::OpenSSL::Digest?

	protected def self.shared_context() : ::OpenSSL::Digest
		digestor = @@digestor
		return digestor if ( digestor )

		digestor = ::OpenSSL::Digest.new("SHA256")

		@@digestor = digestor
		return digestor
	end
end

class Digest::SHA384 < Digest::Base::OpenSSL
	@@digestor : ::OpenSSL::Digest?

	protected def self.shared_context() : ::OpenSSL::Digest
		digestor = @@digestor
		return digestor if ( digestor )

		digestor = ::OpenSSL::Digest.new("SHA384")

		@@digestor = digestor
		return digestor
	end
end

class Digest::SHA512 < Digest::Base::OpenSSL
	@@digestor : ::OpenSSL::Digest?

	protected def self.shared_context() : ::OpenSSL::Digest
		digestor = @@digestor
		return digestor if ( digestor )

		digestor = ::OpenSSL::Digest.new("SHA512")

		@@digestor = digestor
		return digestor
	end
end

class Digest::Whirlpool < Digest::Base::OpenSSL
	@@digestor : ::OpenSSL::Digest?

	protected def self.shared_context() : ::OpenSSL::Digest
		digestor = @@digestor
		return digestor if ( digestor )

		digestor = ::OpenSSL::Digest.new("whirlpool")

		@@digestor = digestor
		return digestor
	end
end
