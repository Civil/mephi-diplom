extern char	*POST_CPU_SKIP_CODE_START[];
extern char	*POST_CPU_SKIP_CODE_END[];

int sram_test(void) __attribute__ ((section (".post_cpu_skip_code")));

int sram_test(void)
{
	register unsigned long storage asm("r4");
	register unsigned long *ram_ptr asm("r5");
	register unsigned long tmp asm("r6");
	/* Workaround for HiTOP debuger. */
	register unsigned long pattern asm("r7");

	pattern = 0xFAFAFAFA;

	ram_ptr = (unsigned long *)SRAM_START;
	while (ram_ptr < (unsigned long *)SRAM_END) {
		if ((ram_ptr >= (unsigned long *)POST_CPU_SKIP_CODE_START) &&
		    (ram_ptr <  (unsigned long *)POST_CPU_SKIP_CODE_END)) {
			/* Skip our-selves */
			storage = 0;
			goto next;
		}

		storage = *ram_ptr;
		*ram_ptr = pattern;
		tmp = *ram_ptr;
		*ram_ptr = storage;
		if (tmp != pattern) {
			tmp = 1;
			goto out;
		}
next:
		ram_ptr++;
	}

	tmp = 0;
out:
	return (int)tmp;
}