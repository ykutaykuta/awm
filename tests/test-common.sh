# program locations

AUDIOWMARK=../src/audiowmark
TEST_MSG=f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0

# common shell functions

die()
{
  echo >&2 "$0: $@"
  exit 1
}

audiowmark()
{
  if [ "x$Q" == "x1" ] && [ -z "$V" ]; then
    AUDIOWMARK_Q="-q"
  else
    echo >&2 ==== audiowmark "$@" ====
  fi
  $AUDIOWMARK $AUDIOWMARK_Q --strict "$@" || die "failed to run audiowmark $@"
}

audiowmark_add()
{
  if [ "x$Q" == "x1" ] && [ -z "$V" ]; then
    AUDIOWMARK_Q="-q"
  else
    echo >&2 ==== audiowmark add "$@" ====
  fi
  $AUDIOWMARK $AUDIOWMARK_Q --strict add "$@" || die "failed to watermark $@"
}

audiowmark_cmp()
{
  if [ "x$Q" == "x1" ] && [ -z "$V" ]; then
    AUDIOWMARK_OUT="/dev/null"
  else
    AUDIOWMARK_OUT="/dev/stdout"
    echo >&2 ==== audiowmark cmp "$@" ====
  fi
  $AUDIOWMARK --strict cmp "$@" > $AUDIOWMARK_OUT || die "failed to detect watermark $@"
}
