#pragma once
#include <ctime>
#include "SharedEnv.h"
#include "ActionModel.h"
#include "planner.h"


class MAPFPlanner
{
public:
    SharedEnvironment* env;
    int num_delivery_simulated_timesteps;

	MAPFPlanner(SharedEnvironment* env): env(env){};
    MAPFPlanner(){env = new SharedEnvironment();};
	virtual ~MAPFPlanner(){delete env;};

    virtual void initialize(int preprocess_time_limit, int num_network_timesteps);

    // return next states for all agents
    virtual void plan(int time_limit, std::vector<Action> & plan);
    virtual void plan_time_expanded(int time_limit, std::vector<Action> & plan);

    std::vector<DefaultPlanner::Double4> get_flow();
    unordered_map<int, vector<int>> get_delivery_agent_paths();
    void plan_pibt(int time_limit,vector<Action> & actions); 
    void set_num_delivery_simulated_timesteps(int num_delivery_simulated_timesteps);
};
