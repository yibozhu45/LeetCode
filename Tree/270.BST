If it is a BST, it means that you can use the characteristic of BST

class Solution {
public:
    int closestValue(TreeNode* root, double target) {
    int a = root->val;
    auto kid = target < a ? root->left : root->right;
    if (!kid) return a;
    int b = closestValue(kid, target);
        //compare condition
    return abs(a - target) < abs(b - target) ? a : b;
}
};
.............................................................
class Solution {
public:
    int closestValue(TreeNode* root, double target) {
        int ans;
        double diff = std::numeric_limits<double>::max();
        TreeNode* curr = root;
        
        while(curr != NULL) {
            double currdiff = target - curr->val;
            
            if (abs(currdiff) < abs(diff)) {
                diff = currdiff;
                ans = curr->val;
            }
                
            if (diff == 0) 
                return target;
            
            curr = currdiff > 0 ? curr->right : curr->left; 
        }
        
        return ans;
    }
};
