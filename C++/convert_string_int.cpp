#include <bits/stdc++.h>

using namespace std;

int changeToNumber(string x) {
    int num = stoi(x);
    return num;
}

void solver() {

    string s;

    vector<int> numbers;

    while(getline(cin, s)) {

        int n = s.length();
        string add = "";
        for(int i = 0; i < n; ++i) {
            if (s[i] == ' ') {
                if (!add.empty())
                    numbers.push_back(changeToNumber(add));
                add = "";
            }
            else if (s[i] != ',')
                add += s[i];
        }

        if (!add.empty())
            numbers.push_back(changeToNumber(add));

    }

    sort(numbers.begin(), numbers.end());

    for(int x : numbers)
        cout << fixed << setprecision(1) << (double)x/10.0 << ' ';
    cout << '\n';

}

int main() {

    ios_base :: sync_with_stdio(0); cin.tie(NULL);

    int t = 1;
    //cin >> t;
    
    while(t--)
        solver();

    return 0;
}
