#!/bin/sh
 
# Copyright © 2020, Trond Endrestøl <Trond.Endrestol@ximalas.info>
 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
 
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
svn --non-interactive status --depth=immediates | awk '
  /^A/  { A++ }
  /^C/  { C++ }
  /^D/  { D++ }
  /^I/  { I++ }
  /^M/  { M++ }
  /^R/  { R++ }
  /^X/  { X++ }
  /^\?/ { q++ }
  /^\!/ { b++ }
  /^\~/ { t++ }
 
  END {
    if (A > 0) {
      printf "A"
      if (A > 1) {
        printf ":%d", A
      }
    }
 
    if (C > 0) {
      if (A > 0) {
        printf " "
      }
 
      printf "C"
      if (C > 1) {
        printf ":%d", C
      }
    }
 
    if (D > 0) {
      if (C > 0 || A > 0) {
        printf " "
      }
 
      printf "D"
      if (D > 1) {
        printf ":%d", D
      }
    }
 
    if (I > 0) {
      if (D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "I"
      if (I > 1) {
        printf ":%d", I
      }
    }
 
    if (M > 0) {
      if (I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "M"
      if (M > 1) {
        printf ":%d", M
      }
    }
 
    if (R > 0) {
      if (M > 0 || I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "R"
      if (R > 1) {
        printf ":%d", R
      }
    }
 
    if (X > 0) {
      if (R > 0 || M > 0 || I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "X"
      if (X > 1) {
        printf ":%d", X
      }
    }
 
    if (q > 0) {
      if (X > 0 || R > 0 || M > 0 || I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "?"
      if (q > 1) {
        printf ":%d", q
      }
    }
 
    if (b > 0) {
      if (q > 0 || X > 0 || R > 0 || M > 0 || I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "!"
      if (b > 1) {
        printf ":%d", b
      }
    }
 
    if (t > 0) {
      if (b > 0 || q > 0 || X > 0 || R > 0 || M > 0 || I > 0 || D > 0 || C > 0 || A > 0) {
        printf " "
      }
 
      printf "~"
      if (t > 1) {
        printf ":%d", t
      }
    }
  }'
 
# EOF