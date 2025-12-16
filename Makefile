clean:
	rm -rf build
	mkdir build

configure:
	cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

build-app:
	cmake --build build

run-clang-tidy:
	main_branch=$$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'); \
	if [ -z "$$main_branch" ]; then \
		echo "Error: Unable to determine the main branch."; \
		exit 1; \
	fi; \
	script_path=$$(find /usr -type f -path "*/share/clang/clang-tidy-diff.py" 2>/dev/null | head -n 1); \
	if [ -z "$$script_path" ]; then \
		echo "Error: clang-tidy-diff.py script not found."; \
		exit 1; \
	fi; \
	diff_output=$$(git diff origin/$$main_branch); \
	if [ -z "$$diff_output" ]; then \
		echo "No changes detected in the diff."; \
		exit 0; \
	fi; \
	echo "$$diff_output" | $$script_path -p1 -path build