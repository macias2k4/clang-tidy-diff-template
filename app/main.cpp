#include "version/version.hpp"

#include <algorithm>
#include <iostream>
#include <string>

namespace
{

[[nodiscard]] bool testFunction()
{
  std::string sample{"ClangTidyDiffTemplate"};
  std::transform(sample.begin(), sample.end(), sample.begin(), ::toupper);
  return sample == "CLANGTIDYDIFFTEMPLATE";
}

} // namespace

int main()
{
    std::cout << projectName << " - " << projectVersion << '\n';
    int a {0};
    return 0;
}