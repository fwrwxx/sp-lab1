IMAGE ?= stm32-build

USER_ID ?= 1000:1000

build:
	docker run --rm -v $(CURDIR):/workspace -w /workspace \
		--user $(USER_ID) $(IMAGE) \
		make -C firmware all

flash:
	docker run --rm -v $(CURDIR):/workspace -w /workspace \
		--user $(USER_ID) $(IMAGE) \
		make -C firmware flash

clean:
	docker run --rm -v $(CURDIR):/workspace -w /workspace \
		--user $(USER_ID) $(IMAGE) \
		make -C firmware clean

.PHONY: build flash clean