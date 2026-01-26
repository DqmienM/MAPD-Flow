#ifndef PLANNER
#define PLANNER

#include "Types.h"
#include "TrajLNS.h"
#include <random>


namespace DefaultPlanner{

    
    void initialize(int preprocess_time_limit, SharedEnvironment* env, int num_network_timesteps);

    void plan(int time_limit,vector<Action> & actions,  SharedEnvironment* env, unordered_map<int,list<int>> agent_guide_path);

    void plan_future_deliveries(int time_limit, SharedEnvironment* env);

    // std::vector<Int4> get_flow();

    unordered_map<int,vector<int>> get_delivery_agent_paths();
    std::vector<Double4> get_opened_flow(SharedEnvironment* env);
    void plan_pibt(int time_limit,vector<Action> & actions, SharedEnvironment* env);
    void display_delivering_agent_paths();
    void display_future_path_accuracy(SharedEnvironment *env);
}
#endif