#include <algorithm>
#include <chrono>
#include <bits/stdc++.h>
#include <cstdlib>
#include <vector>
#define ll long long
#define INF 1e9+7
#define MOD 1000000007
using namespace std;

// Single Core results:
// APPLE M1 (ARM) - 19 seconds
// AMD RYZEN 2700 (4 GHz) - 34 seconds
// AMPERE A1 OCI (ARM) - 36 seconds


int main(){
	int sz = 1000000000;
	int *a = new int[sz];
	for(int i=0;i<sz;i++){
		a[i] = rand()%100;
	}
	
	auto start = chrono::high_resolution_clock::now();
	sort(a, a+sz);
	auto end = chrono::high_resolution_clock::now();
	auto duration = chrono::duration_cast<chrono::microseconds>(end - start);
	cout << "Time taken by function: "
         << duration.count() << " microseconds" << endl;
	cout << "Time taken by function: "
         << float(duration.count()) / float(1000000) << " seconds" << endl;

	delete [] a;

	return 0;
}
