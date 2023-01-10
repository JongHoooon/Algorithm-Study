import UIKit

/*
 Balanced brackets
 https://www.hackerrank.com/challenges/balanced-brackets/problem
 
 A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].

 Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().

 A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].

 By this logic, we say a sequence of brackets is balanced if the following conditions are met:

 It contains no unmatched brackets.
 The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.
 
 */

func isBalanced(s: String) -> String { // "{[()]}"
    // 🕹 Game on here
    /*
    let leftBrackets: [Character] = ["(", "{", "["]
    let rightBrackets: [Character: Character] = ["(": ")",
                                                 "{": "}",
                                                 "[": "]"]
    
    var bracketArray = Array(s)
    var leftBracketsStack = [Character]()
    
    for b in bracketArray {
        if leftBrackets.contains(b) {
            print(b)
            leftBracketsStack.append(b)
        } else {
            guard let lastLeftBracket = leftBracketsStack.last else { return "NO" }
            
            if rightBrackets[lastLeftBracket] == b {
                leftBracketsStack.popLast()
            } else {
                return "NO"
            }
        }
    }
    
    return "Yes"    // 오른쪽 괄호가 더 많은경우도 생각해야한다. isEmpty 사용해서 삼항연산자 사용
     */
    
    var st = [Character]()
    
    for c in s {
        switch c {
        case "{", "(", "[":
            st.append(c)
        case "}":
            if (st.isEmpty || st.last != "{") {
                return "NO"
            }
            st.popLast()
        case ")":
            if (st.isEmpty || st.last != "(") {
                return "NO"
            }
            st.popLast()
        case "]":
            if (st.isEmpty || st.last != "[") {
                return "NO"
            }
            st.popLast()
            
        default:
            print("breaking \(c)")
        }
    }
    
    return st.isEmpty ? "Yes" : "No"
}


isBalanced(s: "{[()]}") // Yes
isBalanced(s: "[()]}") // No
isBalanced(s: "{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))") // Yes
