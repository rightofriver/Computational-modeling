states = ('1', '2')
 
observations = ('1', '2', '3')
 
start_probability = {'1': 0.6, '2': 0.4}
 
transition_probability = {
   '1' : {'1': 0.6, '2': 0.4},
   '2' : {'1': 0.3, '2': 0.7},
   }
 
emission_probability = {
   '1' : {'1': 0.6, '2': 0.3, '3': 0.1},
   '2' : {'1': 0.1, '2': 0.4, '3': 0.5},
   }

def Viterbit(obs, states, s_pro, t_pro, e_pro):
    path = { s:[] for s in states}
    curr_pro = {}
    for s in states:
        curr_pro[s] = s_pro[s]*e_pro[s][obs[0]]
    for i in xrange(1, len(obs)):
        last_pro = curr_pro
        curr_pro = {}
        for curr_state in states:
            max_pro, last_sta = max(((last_pro[last_state]*t_pro[last_state][curr_state]*e_pro[curr_state][obs[i]], last_state) 
                                       for last_state in states))
            curr_pro[curr_state] = max_pro
            path[curr_state].append(last_sta)
    max_pro = -1
    max_path = None
    for s in states:
        path[s].append(s)
        if curr_pro[s] > max_pro:
            max_path = path[s]
            max_pro = curr_pro[s]
    for i in range(0,len(obs)):
        print(str(max_path[i])+'    '),

if __name__ == '__main__':
    obs = ['2', '1', '3', '2', '3', '2', '2', '3', '3', '1', '2', '1', '1', '1', '2', '3', '3', '3', '3', '2' ]
    Viterbit(obs, states, start_probability, transition_probability, emission_probability)
