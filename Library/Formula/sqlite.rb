require 'formula'

class Sqlite <Formula
  url 'http://www.sqlite.org/sqlite-amalgamation-3.7.3.tar.gz'
  md5 '74fe78b264f1c434c4b159d45b78e9b7'
  homepage 'http://www.sqlite.org/'

  def options
  [
    ["--with-rtree", "Enables the R*Tree index module"],
    ["--universal", "Build a universal binary."]
  ]
  end

  def install
    ENV.append "CFLAGS", "-DSQLITE_ENABLE_RTREE=1" if ARGV.include? "--with-rtree"
    ENV.universal_binary if ARGV.include? "--universal"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking"
    system "make install"
  end
end
