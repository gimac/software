function cr = crossover_range_escort(peak_power, antenna_gain, target_rcs, jammer_range, jammer_bandwidth,...
effective_radiated_power, radar_bandwidth, losses, antenna_gain_jammer_direction)
%% Calculate the crossover range for escort jamming.
%     :param peak_power: The peak transmitted power of the radar (W).
%     :param antenna_gain: The gain of the radar antenna.
%     :param target_rcs: The target radar cross section (m^2).
%     :param jammer_range: The range from the radar to the jammer (m).
%     :param jammer_bandwidth: The jammer's transmitting bandwith (Hz).
%     :param effective_radiated_power: The jammer's effective radiated power (W).
%     :param radar_bandwidth: The radar receiver bandwidth (Hz).
%     :param losses: The radar losses.
%     :param antenna_gain_jammer_direction: The gain of the radar antenna in the direction of the jammer.
%     :return: The crossover range (m).
%
%     Created by: Lee A. Harrison
%     On: 5/25/2019

% Check the bandwidth
if jammer_bandwidth > radar_bandwidth
    jammer_bandwidth = radar_bandwidth;
end

cr = ((peak_power * antenna_gain .^ 2 * target_rcs * jammer_bandwidth * jammer_range .^ 2) ./ ...
(effective_radiated_power * 4.0 * pi * radar_bandwidth * losses * antenna_gain_jammer_direction)) .^ 0.25;

