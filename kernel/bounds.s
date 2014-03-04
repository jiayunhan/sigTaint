	.file	"bounds.c"
# GNU C (Debian 4.7.2-5) version 4.7.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.7.2, GMP version 5.0.5, MPFR version 3.1.0-p10, MPC version 0.9
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -nostdinc
# -I /home/fakejohn/Documents/tcp_security/sigTaint/arch/x86/include
# -I arch/x86/include/generated -I include
# -I /home/fakejohn/Documents/tcp_security/sigTaint/arch/x86/include/uapi
# -I arch/x86/include/generated/uapi
# -I /home/fakejohn/Documents/tcp_security/sigTaint/include/uapi
# -I include/generated/uapi -imultiarch x86_64-linux-gnu -D __KERNEL__
# -D CONFIG_AS_CFI=1 -D CONFIG_AS_CFI_SIGNAL_FRAME=1
# -D CONFIG_AS_CFI_SECTIONS=1 -D CONFIG_AS_FXSAVEQ=1 -D CONFIG_AS_AVX=1
# -D CONFIG_AS_AVX2=1 -D CC_HAVE_ASM_GOTO -D KBUILD_STR(s)=#s
# -D KBUILD_BASENAME=KBUILD_STR(bounds)
# -D KBUILD_MODNAME=KBUILD_STR(bounds)
# -isystem /usr/lib/gcc/x86_64-linux-gnu/4.7/include
# -include /home/fakejohn/Documents/tcp_security/sigTaint/include/linux/kconfig.h
# -MD kernel/.bounds.s.d kernel/bounds.c -m64 -mtune=generic -mno-red-zone
# -mcmodel=kernel -maccumulate-outgoing-args -mno-sse -mno-mmx -mno-sse2
# -mno-3dnow -mno-avx -march=x86-64 -auxbase-strip kernel/bounds.s -g -Os
# -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
# -Werror=implicit-function-declaration -Wno-format-security
# -Wno-maybe-uninitialized -Wno-sign-compare -Wframe-larger-than=2048
# -Wno-unused-but-set-variable -Wdeclaration-after-statement
# -Wno-pointer-sign -Werror=implicit-int -Werror=strict-prototypes
# -fno-strict-aliasing -fno-common -fno-delete-null-pointer-checks
# -funit-at-a-time -fstack-protector -fno-asynchronous-unwind-tables
# -fomit-frame-pointer -fno-strict-overflow -fconserve-stack -fverbose-asm
# options enabled:  -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdebug-types-section -fdefer-pop
# -fdevirtualize -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
# -fguess-branch-probability -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -fmath-errno -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -foptimize-register-move -foptimize-sibling-calls -fpartial-inlining
# -fpeephole -fpeephole2 -fprefetch-loop-arrays -free -freg-struct-return
# -fregmove -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstack-protector -fstrict-volatile-bitfields -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vrp
# -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
# -fvect-cost-model -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -maccumulate-outgoing-args
# -malign-stringops -mfancy-math-387 -mfp-ret-in-387 -mglibc -mieee-fp
# -mno-red-zone -mno-sse4 -mpush-args -mtls-direct-seg-refs

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	foo
	.type	foo, @function
foo:
.LFB145:
	.file 1 "kernel/bounds.c"
	.loc 1 17 0
	.cfi_startproc
	.loc 1 19 0
#APP
# 19 "kernel/bounds.c" 1
	
->NR_PAGEFLAGS $25 __NR_PAGEFLAGS	#
# 0 "" 2
	.loc 1 20 0
# 20 "kernel/bounds.c" 1
	
->MAX_NR_ZONES $4 __MAX_NR_ZONES	#
# 0 "" 2
	.loc 1 21 0
# 21 "kernel/bounds.c" 1
	
->NR_PCG_FLAGS $3 __NR_PCG_FLAGS	#
# 0 "" 2
	.loc 1 23 0
# 23 "kernel/bounds.c" 1
	
->NR_CPUS_BITS $9 ilog2(CONFIG_NR_CPUS)	#
# 0 "" 2
	.loc 1 25 0
# 25 "kernel/bounds.c" 1
	
->SPINLOCK_SIZE $4 sizeof(spinlock_t)	#
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE145:
	.size	foo, .-foo
.Letext0:
	.file 2 "include/linux/page-flags.h"
	.file 3 "include/linux/mmzone.h"
	.file 4 "/home/fakejohn/Documents/tcp_security/sigTaint/arch/x86/include/asm/page_types.h"
	.file 5 "include/linux/printk.h"
	.file 6 "include/linux/kernel.h"
	.file 7 "include/linux/page_cgroup.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x20c
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF58
	.byte	0x1
	.long	.LASF59
	.long	.LASF60
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF11
	.uleb128 0x4
	.long	.LASF43
	.byte	0x4
	.byte	0x2
	.byte	0x4a
	.long	0x14f
	.uleb128 0x5
	.long	.LASF12
	.sleb128 0
	.uleb128 0x5
	.long	.LASF13
	.sleb128 1
	.uleb128 0x5
	.long	.LASF14
	.sleb128 2
	.uleb128 0x5
	.long	.LASF15
	.sleb128 3
	.uleb128 0x5
	.long	.LASF16
	.sleb128 4
	.uleb128 0x5
	.long	.LASF17
	.sleb128 5
	.uleb128 0x5
	.long	.LASF18
	.sleb128 6
	.uleb128 0x5
	.long	.LASF19
	.sleb128 7
	.uleb128 0x5
	.long	.LASF20
	.sleb128 8
	.uleb128 0x5
	.long	.LASF21
	.sleb128 9
	.uleb128 0x5
	.long	.LASF22
	.sleb128 10
	.uleb128 0x5
	.long	.LASF23
	.sleb128 11
	.uleb128 0x5
	.long	.LASF24
	.sleb128 12
	.uleb128 0x5
	.long	.LASF25
	.sleb128 13
	.uleb128 0x5
	.long	.LASF26
	.sleb128 14
	.uleb128 0x5
	.long	.LASF27
	.sleb128 15
	.uleb128 0x5
	.long	.LASF28
	.sleb128 16
	.uleb128 0x5
	.long	.LASF29
	.sleb128 17
	.uleb128 0x5
	.long	.LASF30
	.sleb128 18
	.uleb128 0x5
	.long	.LASF31
	.sleb128 19
	.uleb128 0x5
	.long	.LASF32
	.sleb128 20
	.uleb128 0x5
	.long	.LASF33
	.sleb128 21
	.uleb128 0x5
	.long	.LASF34
	.sleb128 22
	.uleb128 0x5
	.long	.LASF35
	.sleb128 23
	.uleb128 0x5
	.long	.LASF36
	.sleb128 24
	.uleb128 0x5
	.long	.LASF37
	.sleb128 25
	.uleb128 0x5
	.long	.LASF38
	.sleb128 8
	.uleb128 0x5
	.long	.LASF39
	.sleb128 12
	.uleb128 0x5
	.long	.LASF40
	.sleb128 8
	.uleb128 0x5
	.long	.LASF41
	.sleb128 4
	.uleb128 0x5
	.long	.LASF42
	.sleb128 11
	.byte	0
	.uleb128 0x6
	.long	.LASF44
	.byte	0x4
	.byte	0x3
	.value	0x105
	.long	0x17b
	.uleb128 0x5
	.long	.LASF45
	.sleb128 0
	.uleb128 0x5
	.long	.LASF46
	.sleb128 1
	.uleb128 0x5
	.long	.LASF47
	.sleb128 2
	.uleb128 0x5
	.long	.LASF48
	.sleb128 3
	.uleb128 0x5
	.long	.LASF49
	.sleb128 4
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.long	0x19c
	.uleb128 0x5
	.long	.LASF50
	.sleb128 0
	.uleb128 0x5
	.long	.LASF51
	.sleb128 1
	.uleb128 0x5
	.long	.LASF52
	.sleb128 2
	.uleb128 0x5
	.long	.LASF53
	.sleb128 3
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.string	"foo"
	.byte	0x1
	.byte	0x10
	.byte	0x1
	.quad	.LFB145
	.quad	.LFE145
	.byte	0x2
	.byte	0x77
	.sleb128 8
	.byte	0x1
	.uleb128 0x9
	.long	.LASF54
	.byte	0x4
	.byte	0x34
	.long	0x65
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	0x49
	.long	0x1d1
	.uleb128 0xb
	.byte	0
	.uleb128 0x9
	.long	.LASF55
	.byte	0x5
	.byte	0x24
	.long	0x1c6
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	0x73
	.long	0x1e9
	.uleb128 0xb
	.byte	0
	.uleb128 0xc
	.long	.LASF56
	.byte	0x6
	.value	0x1b0
	.long	0x1f7
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.long	0x1de
	.uleb128 0xc
	.long	.LASF57
	.byte	0x6
	.value	0x1bb
	.long	0x20a
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.long	0x1de
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF52:
	.string	"PCG_MIGRATION"
.LASF26:
	.string	"PG_head"
.LASF55:
	.string	"console_printk"
.LASF22:
	.string	"PG_reserved"
.LASF47:
	.string	"ZONE_NORMAL"
.LASF29:
	.string	"PG_mappedtodisk"
.LASF36:
	.string	"PG_compound_lock"
.LASF42:
	.string	"PG_slob_free"
.LASF12:
	.string	"PG_locked"
.LASF16:
	.string	"PG_dirty"
.LASF25:
	.string	"PG_writeback"
.LASF23:
	.string	"PG_private"
.LASF37:
	.string	"__NR_PAGEFLAGS"
.LASF34:
	.string	"PG_uncached"
.LASF49:
	.string	"__MAX_NR_ZONES"
.LASF39:
	.string	"PG_fscache"
.LASF14:
	.string	"PG_referenced"
.LASF28:
	.string	"PG_swapcache"
.LASF58:
	.string	"GNU C 4.7.2"
.LASF44:
	.string	"zone_type"
.LASF7:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF35:
	.string	"PG_hwpoison"
.LASF31:
	.string	"PG_swapbacked"
.LASF54:
	.string	"max_pfn_mapped"
.LASF38:
	.string	"PG_checked"
.LASF1:
	.string	"unsigned char"
.LASF59:
	.string	"kernel/bounds.c"
.LASF27:
	.string	"PG_tail"
.LASF43:
	.string	"pageflags"
.LASF50:
	.string	"PCG_LOCK"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"PG_error"
.LASF6:
	.string	"long long unsigned int"
.LASF40:
	.string	"PG_pinned"
.LASF19:
	.string	"PG_slab"
.LASF20:
	.string	"PG_owner_priv_1"
.LASF57:
	.string	"hex_asc_upper"
.LASF18:
	.string	"PG_active"
.LASF8:
	.string	"sizetype"
.LASF24:
	.string	"PG_private_2"
.LASF5:
	.string	"long long int"
.LASF17:
	.string	"PG_lru"
.LASF9:
	.string	"char"
.LASF32:
	.string	"PG_unevictable"
.LASF41:
	.string	"PG_savepinned"
.LASF46:
	.string	"ZONE_DMA32"
.LASF2:
	.string	"short int"
.LASF56:
	.string	"hex_asc"
.LASF51:
	.string	"PCG_USED"
.LASF21:
	.string	"PG_arch_1"
.LASF10:
	.string	"long int"
.LASF48:
	.string	"ZONE_MOVABLE"
.LASF60:
	.string	"/home/fakejohn/Documents/tcp_security/sigTaint"
.LASF15:
	.string	"PG_uptodate"
.LASF53:
	.string	"__NR_PCG_FLAGS"
.LASF0:
	.string	"signed char"
.LASF30:
	.string	"PG_reclaim"
.LASF11:
	.string	"_Bool"
.LASF33:
	.string	"PG_mlocked"
.LASF45:
	.string	"ZONE_DMA"
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
