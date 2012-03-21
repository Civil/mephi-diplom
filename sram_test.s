sram_test:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	r7, .L12
	mov	r5, #4
	b	.L6
.L10:
	mov	r2, r5
	ldr	r3, .L12+4
	cmp	r2, r3
	bcc	.L7
	mov	r2, r5
	ldr	r3, .L12+8
	cmp	r2, r3
	bcs	.L7
	mov	r4, #0
	b	.L8
.L7:
	mov	r3, r5
	ldr	r3, [r3, #0]
	mov	r4, r3
	mov	r2, r5
	mov	r3, r7
	str	r3, [r2, #0]
	mov	r3, r5
	ldr	r3, [r3, #0]
	mov	r6, r3
	mov	r2, r5
	mov	r3, r4
	str	r3, [r2, #0]
	mov	r2, r6
	mov	r3, r7
	cmp	r2, r3
	beq	.L8
	mov	r6, #1
	b	.L9
.L8:
	mov	r3, r5
	add	r3, r3, #4
	mov	r5, r3
.L6:
	mov	r2, r5
	ldr	r3, .L12+12
	cmp	r2, r3
	bls	.L10
	mov	r6, #0
.L9:
	mov	r3, r6
	mov	r0, r3
	ldmfd	sp, {r4, r5, r6, r7, fp, sp, pc}
.L13:
	.align	2