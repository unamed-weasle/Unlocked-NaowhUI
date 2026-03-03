# NaowhUI

## [20260302.01](https://github.com/naowh-dev/NaowhUI/tree/20260302.01) (2026-03-02)
[Full Changelog](https://github.com/naowh-dev/NaowhUI/compare/20260224.01...20260302.01) [Previous Releases](https://github.com/naowh-dev/NaowhUI/releases)

- **Blizzard\_EditMode**  
    - Passing all expected values for C\_EditMode.OnLayoutAdded to further try and force fix instances where layout needs to be"toggled"  
- **Blizzard EditMode**  
    - Modified how events fire when importing an edit mode layout to ensure all frames update properly  
      - The layout now activates and applies frame positions immediately after import, trying to force the equivlant of the "toggle" method provided by BCDM  
      - New layouts are properly registered then immeidetly resaved to try and fire off their location to server side to also avoid the "toggle"method  
- fix installer classcolor not properly pulling RAID\_CLASS\_COLORS  
- added CompleteSetup notice back to Class Layouts  
- Update Death Knight layout  
- Update Warlock layout  
- Update Monk layout  
- Update Warrior layout  
- Update Priest layout  
- Add release webhook  
- Chore: Profile updates  
